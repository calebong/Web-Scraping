# Function to get latest financial news from various sources into a tidy format
require("dplyr");require("tidyr");require("purrr");require("httr");require("lubridate");require("furrr");require("jsonlite");require("rvest")
# rvest version 0.3.6

future::plan('multisession')

## Bloomberg News
bbNewsSource <- read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('td:nth-child(1) table:nth-child(1) .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        ua <-
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:92.0) Gecko/20100101 Firefox/92.0"
        tmp <- tryCatch(
          .x %>%
            httr::GET(user_agent(ua)) %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[2]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        ua <-
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:92.0) Gecko/20100101 Firefox/92.0"
        tmp <-
          tryCatch(
            .x %>%
              httr::GET(user_agent(ua)) %>%
              read_html() %>%
              html_nodes(xpath = '/html/head/meta[13]') %>%
              html_attr('content'),
            error = function(e) {
              print(paste(.x, 'not found'))
              NA
            }
          )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(articleText = purrr::map(
    .x = value,
    .f = function(.x) {
      ua <-
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:92.0) Gecko/20100101 Firefox/92.0"
      tmp <- tryCatch(
        .x %>%
          httr::GET(user_agent(ua)) %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble(),
        error = function(e) {
          print(paste(.x, 'not found'))
          NA
        }
      )
    }
  ))

bbNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-7~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        ua <-
          "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36"
        tmp <- tryCatch(
          .x %>%
            httr::GET(user_agent(ua)) %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[2]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        ua <-
          "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36"
        tmp <-
          tryCatch(
            .x %>%
              httr::GET(user_agent(ua)) %>%
              read_html() %>%
              html_nodes(xpath = '/html/head/meta[13]') %>%
              html_attr('content'),
            error = function(e) {
              print(paste(.x, 'not found'))
              NA
            }
          )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(articleText = purrr::map(
    .x = value,
    .f = function(.x) {
      ua <-
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36"
      tmp <- tryCatch(
        .x %>%
          httr::GET(user_agent(ua)) %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble(),
        error = function(e) {
          print(paste(.x, 'not found'))
          NA
        }
      )
    }
  ))

marketwatchNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-1~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[48]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# Marketwatch News
marketwatchNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-1~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[48]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

marketwatchNewsSource <-
  read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('td:nth-child(5) table:nth-child(1) .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[48]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# Fox News

foxNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-11~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[35]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/meta[24]') %>%
          html_attr('content')
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.article-body p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

foxNewsSource <- read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(5) table:nth-child(2) .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[35]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/meta[24]') %>%
          html_attr('content')
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.article-body p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# New York Times

nytimesNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-6~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[16]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

nytimesNewsSource <-
  read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(3) table~ table+ table .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[16]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# Reuters
reutersNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-3~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[48]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleHeader-headline-NlAqj') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleBody-para-TD_9x') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

reutersNewsSource <-
  read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(1) table:nth-child(2) .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[48]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleHeader-headline-NlAqj') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleBody-para-TD_9x') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# BBC

bbcNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-9~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '//*[@id="main-content"]/div[5]/div/div[1]/article/header/div[1]/dl/div/dd/span/time') %>%
            html_attr('datetime') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('#main-heading') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.eq5iqo00') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

bbcNewsSource <- read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(1) table~ table+ table .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '//*[@id="main-content"]/div[5]/div/div[1]/article/header/div[1]/dl/div/dd/span/time') %>%
            html_attr('datetime') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('#main-heading') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.eq5iqo00') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )

# CNBC

cnbcNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-10~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '//*[@id="main-article-header"]/div/div[1]/div[2]/time[1]') %>%
            html_attr('datetime') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleHeader-headline') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )


cnbcNewsSource <- read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(3) table:nth-child(2) .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '//*[@id="main-article-header"]/div/div[1]/div[2]/time[1]') %>%
            html_attr('datetime') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('.ArticleHeader-headline') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(
    articleText = furrr::future_map(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes('p') %>%
          html_text() %>%
          as_tibble()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  )


# CNN

cnnNewsTime <- read_html('https://finviz.com/news.ashx') %>%
  html_nodes('.is-5~ td .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[7]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(articleText = purrr::map(
    .x = value,
    .f = function(.x) {
      .x %>%
        read_html() %>%
        html_nodes('.zn-body__paragraph') %>%
        html_text() %>%
        as_tibble()
    }
  ))


cnnNewsSource <- read_html('https://finviz.com/news.ashx?v=2') %>%
  html_nodes('table+ table td:nth-child(5) table~ table+ table .nn-tab-link') %>%
  html_attr("href") %>%
  as_tibble() %>%
  mutate(
    time = furrr::future_map(
      .x = value,
      .f = function(.x) {
        tmp <- tryCatch(
          .x %>%
            read_html() %>%
            html_nodes(xpath = '/html/head/meta[7]') %>%
            html_attr('content') %>%
            unlist(),
          error = function(e) {
            print(paste(.x, 'not found'))
            NA
          }
        )
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    ),
    time = lubridate::as_datetime(unlist(map(
      time, ~ replace(.x, is_empty(.x), NA)
    )), tz = 'Asia/Singapore')
  ) %>%
  filter(!is.na(time)) %>%
  mutate(
    articleTitle = furrr::future_map_chr(
      .x = value,
      .f = function(.x) {
        .x %>%
          read_html() %>%
          html_nodes(xpath = '/html/head/title/text()') %>%
          html_text()
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )
  ) %>%
  mutate(articleText = purrr::map(
    .x = value,
    .f = function(.x) {
      .x %>%
        read_html() %>%
        html_nodes('.zn-body__paragraph') %>%
        html_text() %>%
        as_tibble()
    }
  ))

# TradingEconomics

teNews <-
  read_json('https://tradingeconomics.com/ws/stream.ashx?start=0&size=100',
            simplifyVector = T) %>%
  as_tibble() %>%
  select(url, date, title, description) %>%
  mutate(
    url = paste0('https://tradingeconomics.com', url),
    date = as_datetime(as_datetime(date, tz = 'UTC'), tz = 'Asia/Singapore'),
    description = purrr::map(
      .x = description,
      .f = function(.x)
        as_tibble(.x)
    )
  ) %>%
  rename(
    value = url,
    time = date,
    articleTitle = title,
    articleText = description
  )


teUsaNews <-
  read_json(
    'https://tradingeconomics.com/ws/stream.ashx?start=0&size=100&c=united%20states',
    simplifyVector = T
  ) %>%
  as_tibble() %>%
  select(url, date, title, description) %>%
  mutate(
    url = paste0('https://tradingeconomics.com', url),
    date = as_datetime(as_datetime(date, tz = 'UTC'), tz = 'Asia/Singapore'),
    description = purrr::map(
      .x = description,
      .f = function(.x)
        as_tibble(.x)
    )
  ) %>%
  rename(
    value = url,
    time = date,
    articleTitle = title,
    articleText = description
  ) %>%
  filter(time > Sys.Date() - 5)

teChinaNews <-
  read_json(
    'https://tradingeconomics.com/ws/stream.ashx?start=0&size=100&c=china',
    simplifyVector = T
  ) %>%
  as_tibble() %>%
  select(url, date, title, description) %>%
  mutate(
    url = paste0('https://tradingeconomics.com', url),
    date = as_datetime(as_datetime(date, tz = 'UTC'), tz = 'Asia/Singapore'),
    description = purrr::map(
      .x = description,
      .f = function(.x)
        as_tibble(.x)
    )
  ) %>%
  rename(
    value = url,
    time = date,
    articleTitle = title,
    articleText = description
  ) %>%
  filter(time > Sys.Date() - 5)

teNews <- rbind(teNews, teUsaNews, teChinaNews) %>% distinct()

# Combine all
allNews <-
  rbind(
    marketwatchNewsTime,
    foxNewsTime,
    nytimesNewsTime,
    reutersNewsTime,
    bbcNewsTime,
    cnbcNewsTime,
    cnnNewsTime,
    marketwatchNewsSource,
    foxNewsSource,
    nytimesNewsSource,
    reutersNewsSource,
    bbcNewsSource,
    cnbcNewsSource,
    cnnNewsSource,
    bbNewsSource,
    teNews
  ) %>%
  arrange(desc(time)) %>%
  distinct() 

future::plan('sequential')