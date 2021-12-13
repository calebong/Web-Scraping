require("purrr");require("httr");require("lubridate");require("furrr");require("jsonlite")

# Function to get Stocktwits

getStockTwits <- function(tickers, n) {
  
  # Internal function to remove NA list from break
  na.omit.list <-
    function(y) {
      return(y[!vapply(y, function(x)
        all(is.na(x)), logical(1))])
    }
  
  # Internal function to obtain latest 30 tweets
  tmpFun <- function(ticker, n = 2) {
    out <- purrr::map(
      ticker,
      .f = function(.x) {
        tmp1 <-
          tryCatch(
            read_json(
              paste0(
                'https://api.stocktwits.com/api/2/streams/symbol/',
                .x,
                '.json?limit=30'
              ),
              simplifyVector = T
            )$messages,
            error = function(e) {
              (paste(.x, 'not found'))
              NA
            }
          )
        return(tmp1)
      }
    )
    
    # Internal function to recursively obtain next n batches of 30 tweets
    if (n > 1) {
      for (i in seq(2, n)) {
        out[i] <- purrr::map(
          ticker,
          .f = function(.x) {
            tryCatch(
              read_json(
                paste0(
                  'https://api.stocktwits.com/api/2/streams/symbol/',
                  .x,
                  '.json?max=',
                  purrr::pluck(out, i -
                                 1) %>% pull(id) %>% last()
                ),
                simplifyVector = T
              )$messages,
              error = function(e) {
                (paste(.x, 'not found'))
                NA
              }
            )
          }
        )
        if (is.na(out[i]))
          
          break
        
      }
      out <- na.omit.list(out)
    }
    
    return(out)
  }
  
  out1 <- furrr::future_map(
    tickers,
    .f = function(.x)  {
      tmpFun(.x, n = n)
    },
    .progress = TRUE,
    .options = furrr::furrr_options(seed = TRUE)
  )
  
  names(out1) <- tickers
  
  out1 <- out1 %>%
    compact() %>%
    enframe() %>%
    mutate(
      value = furrr::future_map(.x = value,
                                function(.x) {
                                  tmp <- try(.x %>%
                                               bind_rows() %>%
                                               mutate(
                                                 created_at = lubridate::as_datetime(created_at, tz = 'Asia/Singapore') %>% suppressMessages()
                                               ) %>%
                                               select(body, created_at) %>%
                                               rename(value = body,
                                                      time = created_at))
                                  if (!inherits(tmp, "try-error"))
                                    tmp
                                },
                                .progress = TRUE,
                                .options = furrr::furrr_options(seed = TRUE))
    ) %>%
    rename(comment = value)
  
  return(out1)
}