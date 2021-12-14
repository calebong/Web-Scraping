---
output:
  html_document:
    keep_md: true
---



# Illustration of getStockTwits function

This short document displays the output of getStockTwits, a function that extracts the latest comments from StockTwits.

# Load and run script


```r
# load libraries
library(tibble)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)
library(kableExtra)
```

```
## 
## Attaching package: 'kableExtra'
```

```
## The following object is masked from 'package:dplyr':
## 
##     group_rows
```

```r
# load function
source(file = "getStockTwits.R") 
```

```
## Loading required package: purrr
```

```
## Loading required package: httr
```

```
## Loading required package: lubridate
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:base':
## 
##     date, intersect, setdiff, union
```

```
## Loading required package: furrr
```

```
## Loading required package: future
```

```
## Loading required package: jsonlite
```

```
## 
## Attaching package: 'jsonlite'
```

```
## The following object is masked from 'package:purrr':
## 
##     flatten
```

The argument n is the number of batches of 30 tweets to be extracted. Parallel processing is applied across the number of tickers, such that multiple tickers can be extracted simultaneously.


```r
future::plan('multisession')
out <- getStockTwits(c('SPY','QQQ','AAPL','TSLA'), n = 10)
future::plan('sequential')
```


# Display getStockTwits output

The output contains columns that contain the ticker, comments, and time of posting. This information can be utilized for sentiment analysis.


```r
out
```

```
## # A tibble: 4 × 2
##   name  comment       
##   <chr> <list>        
## 1 SPY   <df [300 × 2]>
## 2 QQQ   <df [300 × 2]>
## 3 AAPL  <df [300 × 2]>
## 4 TSLA  <df [300 × 2]>
```



```r
out %>%
  unnest(cols = c(comment)) %>% 
  kable() %>%
  kable_styling("striped", full_width = F, fixed_thead = T) %>%
  scroll_box(width = "100%", height = "1000px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:1000px; overflow-x: scroll; width:100%; "><table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;position: sticky; top:0; background-color: #FFFFFF;"> name </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;position: sticky; top:0; background-color: #FFFFFF;"> value </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;position: sticky; top:0; background-color: #FFFFFF;"> time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM 
How strong will the bounce be? I say about 1.5 to 2% tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 09:02:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY so we learn today Fox News is full of actors, they were saying something to Trump on January 6th while pushing a completely different message to  their viewers </td>
   <td style="text-align:left;"> 2021-12-14 09:02:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Anybody playing chess with FOMC knows what will be discussed. Supply chain, inflation, rates. But are we brainstorming any wild card ? I’m interested </td>
   <td style="text-align:left;"> 2021-12-14 09:02:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY “puts are literally free money”

*finds out a week later they shorted the bottom* 😂😂 </td>
   <td style="text-align:left;"> 2021-12-14 09:01:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Puts are literally free money for this week </td>
   <td style="text-align:left;"> 2021-12-14 09:01:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY giving China your money. Fools.  https://www.tradingview.com/chart/AAPL/rvCgDRdv-Apple-Ponzied-Made-in-China-Ponzi-Pogs-Stonks/ </td>
   <td style="text-align:left;"> 2021-12-14 09:01:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY don’t be bearish in bull market </td>
   <td style="text-align:left;"> 2021-12-14 09:00:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY it’s very simple. SPY dips, I buy!! </td>
   <td style="text-align:left;"> 2021-12-14 09:00:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY . </td>
   <td style="text-align:left;"> 2021-12-14 09:00:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY uninvestable stock market rn.  Stay away until shit clears up little </td>
   <td style="text-align:left;"> 2021-12-14 09:00:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY </td>
   <td style="text-align:left;"> 2021-12-14 09:00:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY dad, you gonna hurt me? </td>
   <td style="text-align:left;"> 2021-12-14 09:00:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY bears bring futures red </td>
   <td style="text-align:left;"> 2021-12-14 09:00:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY is omicron cases in China too? Only Bloomberg will tell what is going on </td>
   <td style="text-align:left;"> 2021-12-14 08:59:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 📉📉📉📉 </td>
   <td style="text-align:left;"> 2021-12-14 08:59:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY omicron virus is concerning how did UK get so much.  What is going on in South Africa </td>
   <td style="text-align:left;"> 2021-12-14 08:59:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I guess this stupid omicron is gona be the reason they tank it this time lol..no one even cares about covid anymore </td>
   <td style="text-align:left;"> 2021-12-14 08:58:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  puts are to be scalped only </td>
   <td style="text-align:left;"> 2021-12-14 08:58:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Good morning, everyone from Asia, and welcome to another session. $NKD_F might have ended the three waves pullback higher, and a roll lower can have started. Here is the latest 1 Hour chart to members at https://elliottwave-forecast.com/, showing the idea. #elliottwave #trading $USDJPY $SPX $SPY $ES_F </td>
   <td style="text-align:left;"> 2021-12-14 08:58:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA $SPY Interesting but probably doesn&amp;#39;t mean much considering all the Brrrrrrrrrrrrrrrrrrrrrrrrrrrr </td>
   <td style="text-align:left;"> 2021-12-14 08:58:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  when you’re options are low you load that shit </td>
   <td style="text-align:left;"> 2021-12-14 08:57:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY lol ripping after hours wiping out the closing sell off. Puts so unreliable it’s almost hilarious </td>
   <td style="text-align:left;"> 2021-12-14 08:57:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 🐻 </td>
   <td style="text-align:left;"> 2021-12-14 08:57:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Coming for your gains. </td>
   <td style="text-align:left;"> 2021-12-14 08:57:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> The $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:57:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> MS $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:57:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Big part of trading is knowing when you can and cant trade. </td>
   <td style="text-align:left;"> 2021-12-14 08:57:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY markets needs to go down for the next couple of days so that we can buy on Thursday </td>
   <td style="text-align:left;"> 2021-12-14 08:56:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY so many trading accounts on Instagram promoting their shit discords

LOL all anyone had to do was blindly throw a dart at the weeklies call options. </td>
   <td style="text-align:left;"> 2021-12-14 08:56:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY scary pic for the night….. let’s see what the Feds got to say this week </td>
   <td style="text-align:left;"> 2021-12-14 08:55:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Hedge Funds Are Crazy About #Skillsoft Corp. $SKIL Also $CYH $COHU $SPY $BV https://talkmarkets.com/content/stocks--equities/hedge-funds-are-crazy-about-skillsoft-corp?post=337724 </td>
   <td style="text-align:left;"> 2021-12-14 08:55:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY oh great.. </td>
   <td style="text-align:left;"> 2021-12-14 08:55:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY volatility likely here to stay </td>
   <td style="text-align:left;"> 2021-12-14 08:53:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY AMERICA COLLAPSES NOW AND FROM THE ASHES WE REBUILD </td>
   <td style="text-align:left;"> 2021-12-14 08:53:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY ppl complaining about inflation and no one is talking about pay raises </td>
   <td style="text-align:left;"> 2021-12-14 08:53:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA I be Stalking on Tesla from now on 

  🧞‍♂️💲🎄 $SPY $SPX $ES_F  in here Dec 13th </td>
   <td style="text-align:left;"> 2021-12-14 08:53:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 1/6 committee votes to bring contempt charges against Mark Meadows. </td>
   <td style="text-align:left;"> 2021-12-14 08:52:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  I’ll never go all cash are you fucking kidding or what </td>
   <td style="text-align:left;"> 2021-12-14 08:52:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $QQQ $SPY $SNOW $TSLA $IWM  🔥🔥🔥🥵 Just  started the 🩸 </td>
   <td style="text-align:left;"> 2021-12-14 08:52:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY is this what BTD means guys? </td>
   <td style="text-align:left;"> 2021-12-14 08:52:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I am astonished people out there still wear masks. Literally, y’all are crazy sheep </td>
   <td style="text-align:left;"> 2021-12-14 08:52:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Fed meeting is priced, bond market is already pricing in two hikes for next year..market will go up massively after the Fed meeting </td>
   <td style="text-align:left;"> 2021-12-14 08:52:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY keep on buying the S&amp;amp;P50. Give your kids your stock, make sure they don’t sell. Pass down for generations </td>
   <td style="text-align:left;"> 2021-12-14 08:52:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $IWM $SPY $QQQ So 37 NFL players tested positive for Covid today, which I believe is a high on positive tests. I do think this micro environment also represents the macro environment, meaning the U.S etc etc, expect more covid BS in the coming days. Fed, covid, we just need a war right now for the cherry on the top. </td>
   <td style="text-align:left;"> 2021-12-14 08:52:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY like if your bullish af!!!! 🚀🚀🚀🚀 </td>
   <td style="text-align:left;"> 2021-12-14 08:51:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY like if your 🐻 🐻🐻🐻🐻🐻🐻 </td>
   <td style="text-align:left;"> 2021-12-14 08:51:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY until Wednesday till uncle Jerome talks the market will be getting dumped. </td>
   <td style="text-align:left;"> 2021-12-14 08:51:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY gamblers here&amp;#39;s your/my trade $CDAY sell the Jan 115c @ $1.65 and buy the Jan 80p @ $.34 net credit $1.31 per unit. one could add a 130 wing overhead protection).
cheers! </td>
   <td style="text-align:left;"> 2021-12-14 08:51:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $UVXY until Banks can put in a reversal of more than one day there&amp;#39;s no need to be bullish on this Market tech is crushed and banks are crushed what the hell are you freaking bullish about lol?. $SPY $QQQ $XBI $XLF </td>
   <td style="text-align:left;"> 2021-12-14 08:51:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $IWM 

Stock futures tick higher ahead of key inflation data, Fed meeting https://www.cnbc.com/2021/12/13/stock-market-futures-open-to-close-news.html?__source=iosappshare%7Ccom.apple.UIKit.activity.CopyToPasteboard </td>
   <td style="text-align:left;"> 2021-12-14 08:51:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY How ya like that $4720’s on the way now </td>
   <td style="text-align:left;"> 2021-12-14 08:51:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY are futes rippin yet? </td>
   <td style="text-align:left;"> 2021-12-14 08:51:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Let me guess tonight.. &amp;quot;Futes Rippin&amp;quot; but dumps in the morning as always. </td>
   <td style="text-align:left;"> 2021-12-14 08:51:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY uK more new virus covid cases one side all central banks fighting inflation.  What will happen to the economies. Maybe the central banks will lead to a greater recession. </td>
   <td style="text-align:left;"> 2021-12-14 08:50:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY If the media didn&amp;#39;t make up a whole bunch of fear mongering bullshit the market would go vertical non-stop.

Drama sells though. Well puts. </td>
   <td style="text-align:left;"> 2021-12-14 08:50:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ Ladies and gentlemen,  we have another fake pump happening in futures now.
PAIN IS COMING 
and it&amp;#39;s just around the corner 🔻🔻🔻✌ </td>
   <td style="text-align:left;"> 2021-12-14 08:50:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $DWAC $SPY $QQQ  this. </td>
   <td style="text-align:left;"> 2021-12-14 08:50:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY If Billionaires can&amp;#39;t have your kids then neither will you,Spongebrains still in serious denial stage that vaccines are meant to help ,big Pharma ,big government loves you🤡🤡🤡🤡 </td>
   <td style="text-align:left;"> 2021-12-14 08:50:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY gap down at open </td>
   <td style="text-align:left;"> 2021-12-14 08:50:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY All cash other then cryptos I’ve had for years. Good luck. </td>
   <td style="text-align:left;"> 2021-12-14 08:49:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY My reaction when my boss handed me my Christmas bonus earlier today… </td>
   <td style="text-align:left;"> 2021-12-14 08:49:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY pump into open </td>
   <td style="text-align:left;"> 2021-12-14 08:49:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY FuTeS RiPpiN </td>
   <td style="text-align:left;"> 2021-12-14 08:49:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 🤣 </td>
   <td style="text-align:left;"> 2021-12-14 08:48:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY No shit                   Again 🧞‍♂️

     A Mega Squeeze    $SPX $ES_F $DIA </td>
   <td style="text-align:left;"> 2021-12-14 08:48:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY all of you saying green futures do you realize they also were yesterday </td>
   <td style="text-align:left;"> 2021-12-14 08:48:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY meme stock sell off lol. And light volume overall. bears are gonna learn the hard way again this week. </td>
   <td style="text-align:left;"> 2021-12-14 08:48:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY just waiting until we’re green on weds day afternoon. </td>
   <td style="text-align:left;"> 2021-12-14 08:48:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY FUTES RIPPING 😂😂😂👍🏽👍🏽👍🏽🚀🚀🚀🚀 </td>
   <td style="text-align:left;"> 2021-12-14 08:47:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ Futures up, as of now it looks like we will see a green day tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:47:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I’m staying away from the market right now. A lot of weird stuff going on underneath the hood. </td>
   <td style="text-align:left;"> 2021-12-14 08:47:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY in before the FuTES RiPpiN crowd </td>
   <td style="text-align:left;"> 2021-12-14 08:47:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY mark this post. Waiting a couple years until we see doomsday predictions for when we hit $666. </td>
   <td style="text-align:left;"> 2021-12-14 08:47:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AABB $SPY $TSLA $AAPL $BTC.X The&amp;gt; GOLDEN CROSS Coming &amp;amp; fianchill PT 1.79$ BOOM Coming https://aabbgoldtoken.com/uncategorized/asia-broadband-sets-december-launch-date-for-proprietary-cryptocurrency-exchange/2021/12/08/ </td>
   <td style="text-align:left;"> 2021-12-14 08:46:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  
 
I&amp;#39;m inviting you to start investing in crypto with Voyager. Download the app and trade $100 to get $25 of free Bitcoin. 
 
Use code 1466BE9BC or this link to claim your BTC: 
 
https://voyager.onelink.me/WNly/referral?af_sub5=1466BE9BC </td>
   <td style="text-align:left;"> 2021-12-14 08:46:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Hilarious.  

They just had a chance to recall this clown and now look!   Good!  To be honest they deserve this.  No sympathy.  

&amp;quot;California imposes monthlong mask mandate for indoor public places regardless of vaccination status
PUBLISHED MON, DEC 13 20217:00 PM EST&amp;quot; </td>
   <td style="text-align:left;"> 2021-12-14 08:45:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA Now a Steal Under 1 Trillion 🧞‍♂️

$spy $spx $es_f $dia </td>
   <td style="text-align:left;"> 2021-12-14 08:45:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AAPL $IWM $QQQ $SPY $AMZN powell is watching ya bears be careful </td>
   <td style="text-align:left;"> 2021-12-14 08:45:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $btc.x $spy we are very likely entering into an era in history next year where &amp;quot;sitting in cash&amp;quot; to avoid market turbulence will begin to erode cash value at a rate similar to the % declines you are familiar with in asset markets. Recency bias obscures pondering this scenario. Everyone plans for the future based on the familiar past. 

But runaway inflation? he table gets flipped and new rules replace the old. </td>
   <td style="text-align:left;"> 2021-12-14 08:45:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $DIA $QQQ $SPY and the best part is theres nothing any of you can do about it! Lmfao, go get jobs get into the real world instead of trying to support yourselves off your lil puny stock accounts. Bums </td>
   <td style="text-align:left;"> 2021-12-14 08:45:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA 
No way Brandon &amp;amp; JPow gonna crash the market right before Christmas.. &amp;quot;c&amp;#39;mon man&amp;quot;. </td>
   <td style="text-align:left;"> 2021-12-14 08:45:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY outperforms 77% of all stocks! https://www.chartmill.com/stock/quote/SPY/technical-analysis?key=84303b30-e7bc-44d7-b0b1-1493858db9a2&amp;amp;utm_source=stocktwits&amp;amp;utm_medium=TA&amp;amp;utm_content=SPY&amp;amp;utm_campaign=social_tracking </td>
   <td style="text-align:left;"> 2021-12-14 08:45:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $4720 </td>
   <td style="text-align:left;"> 2021-12-14 08:44:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY joe Biden isn’t a smart guy is he? How do these people make it </td>
   <td style="text-align:left;"> 2021-12-14 08:43:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Mark Meadows better pull a Midnight Run. </td>
   <td style="text-align:left;"> 2021-12-14 08:43:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> US small-cap stocks trade at historic discount to corporate titans

$SPY $IWM $SP600 $QQQ 

https://www.ft.com/content/a894adff-7ca2-4fdc-bc85-c43bc2c53491 </td>
   <td style="text-align:left;"> 2021-12-14 08:43:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Dudes it’s “Mega Squeezing Now” 

🧞‍♂️ $SPX $ES_F  S&amp;amp;P Squeezing Now </td>
   <td style="text-align:left;"> 2021-12-14 08:42:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:42:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Market is down, but hey I&amp;#39;m engaged. </td>
   <td style="text-align:left;"> 2021-12-14 08:42:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY tutes been ripping tutes I mean futes </td>
   <td style="text-align:left;"> 2021-12-14 08:42:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY today was Shimao Realestate Investment Firm’s fault.  China can’t keep it in it’s pants for one month. </td>
   <td style="text-align:left;"> 2021-12-14 08:41:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I need to make a quick 100k, anyone have an easy play? </td>
   <td style="text-align:left;"> 2021-12-14 08:41:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Omicron raging across UK….What’s the deal with that engineered virus? </td>
   <td style="text-align:left;"> 2021-12-14 08:41:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Currently up 150k so far this year with 2 more trading weeks left. I know that’s peanuts compared to what some make here but it’s from playing both sides bull and bear, don’t get stuck on 1 side, play both, make money both ways. </td>
   <td style="text-align:left;"> 2021-12-14 08:40:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Small cap 😱😭 </td>
   <td style="text-align:left;"> 2021-12-14 08:40:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY What do people expect the FED to do? They have an 8T balance sheet, .gov has nearly 30T in debt. Raising rates is suicide for both agencies. 
 
These idiots are about to shove nearly 70% of society under the bus to save their own skin. </td>
   <td style="text-align:left;"> 2021-12-14 08:40:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Do they really need to pin it at 666, demonic bastards </td>
   <td style="text-align:left;"> 2021-12-14 08:39:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY FUTES ARE RIPPING </td>
   <td style="text-align:left;"> 2021-12-14 08:39:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY these stock prices and crypto prices are the problem everyone has too much money and it’s literally a bidding war on everything while wages remain the same. Bring it down !!! Smart money is getting out now lol </td>
   <td style="text-align:left;"> 2021-12-14 08:39:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY So much bad news. This should easily hit $480 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:38:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $QQQ $SPY $AMC $GME $BTC.X all the degenerates should be thankful the losses are coming on this side of New Years so you can offset your losses against your gains from earlier in the year (if you had any) </td>
   <td style="text-align:left;"> 2021-12-14 08:37:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $ES_F $SPX $SPY  🧞‍♂️

Yeah, this is a Mega Short Squeeze in Progress right now 

Just like last night $QQQ $DIA In Progress </td>
   <td style="text-align:left;"> 2021-12-14 08:37:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $BTC.X That fed meeting will be key. Tapering asap imo and rate increase has to come soon due to this insane inflation problem. Black swan moment coming. $SPY $SPX </td>
   <td style="text-align:left;"> 2021-12-14 08:37:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Huge misconception preached by perma bears regarding long SPY bulls:

We - hedge on volatility dump; chart daily; and buy free BTD share via hedge and option selling.

Long bull ride the full course, whilst you dumb fucks average down on every failed prediction.

There is a difference. Think about it. </td>
   <td style="text-align:left;"> 2021-12-14 08:37:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY This put is a free money glitch bro… </td>
   <td style="text-align:left;"> 2021-12-14 08:37:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I’m going all cash for first time in life </td>
   <td style="text-align:left;"> 2021-12-14 08:37:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $NVDA $AMZN $TSLA looks like the fed trapped themselves and the market has identified it. Refuse to accelerate the taper, have massive inflation caused by the fed. Taper, and the market collapses. Fed refused to pull out of the market after the financial crisis, this could get nasty </td>
   <td style="text-align:left;"> 2021-12-14 08:36:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $AAPL who’s the kind gentleman who was very humbly bragging about making $.5 million last night when the futures were up .34%?

Future lesson, 

Pride is concerned with who is right

Humility is concerned with what is right

Wear your wealth humbly my friend, at least what’s left of it </td>
   <td style="text-align:left;"> 2021-12-14 08:35:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY its not like the biggest housing developer in history is about to go bakrupt or anything..buy buy buy </td>
   <td style="text-align:left;"> 2021-12-14 08:35:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $IWM BEARS </td>
   <td style="text-align:left;"> 2021-12-14 08:35:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY will be huge day tomorrow. Breakout </td>
   <td style="text-align:left;"> 2021-12-14 08:35:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY welp this Australian parliament member will be abducted taken to concentration camp 

https://youtu.be/PDy3IG35toI </td>
   <td style="text-align:left;"> 2021-12-14 08:34:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY lower first </td>
   <td style="text-align:left;"> 2021-12-14 08:34:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $QQQ $SPY Former US Treasury Secretary Summers calls on 4 rate hikes by Fed next year. He sees inflation and overextended markets as major risks to the economy in 2022. </td>
   <td style="text-align:left;"> 2021-12-14 08:34:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $IRNT breaking new low’s while the $SPY sitting at ath’s! </td>
   <td style="text-align:left;"> 2021-12-14 08:34:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> The $SPY had an inside day and the $SPX missed that by less than 1.5 pts.  Just a tease there... 

Essentially, it was an SP500 consolidation despite all the other action. 

The VIX closed just above 20 just to taunt the Bulls.  So far, this is a retracement of a bounce off of the prior low.  IMO...  2/2 </td>
   <td style="text-align:left;"> 2021-12-14 08:34:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY &amp;quot;Expodentially&amp;quot;... hey you for him not me.
https://www.youtube.com/watch?v=jZ9sz5_o-uE </td>
   <td style="text-align:left;"> 2021-12-14 08:32:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $NASDAQ  bulls have to know what the economy is doing, the market is running on no major catalyst other then overinflation from powell printing money out of his ass, which mms might just be upping to trap people into a fucked up crash. Two new variants of the virus with no bio tech reports? Thats suspect! Powell raising interest rates and considering how much borrowed money is in the stock market and crypto, people tend to withdraw that borrowed money as the fed raises interest rates. This market is a floating donkey ready to bust at any single catalyst that has the slight of hand to crash this to the floor. I think this is a setup to trap every investment and drop it to the fucking floor with one big press release. Just my opinion. And judging by alot of the permabulls in current market conditions they’re will be a quick mood swing from happy pump to market in shreds. Permabulls will cry themselves to sleep for months wondering how they are gonna afford rent. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY interest rates hikes are the most likely action given that the average Americans are paying $8 for gas and a king&amp;#39;s ransom for groceries!  Even life-long democrats are about to switch party because of Biden and his high inflation!  I don&amp;#39;t care how you do it, Biden,  lower the high inflation and this stock price by the end of tomorrow, or you can kiss the oval office goodbye in 2024.  Do you want 4 more years of Trump!? </td>
   <td style="text-align:left;"> 2021-12-14 08:32:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA 🎯👇

https://www.msn.com/en-us/money/markets/billionaire-investor-bill-ackman-says-inflation-is-being-underreported-by-the-government-due-to-soaring-rent-costs/ar-AARLKsE?ocid=msedgntp </td>
   <td style="text-align:left;"> 2021-12-14 08:32:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY US indices close lower on the day. Nasdaq leads the declines https://www.billionaireclubcollc.com/us-indices-close-lower-on-the-day-nasdaq-leads-the-declines/ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA $AAPL $SPY $QQQ $DIA  

https://apple.news/AVSGYxVxYQmWGVFiB5JXQZQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $spy $qqq futures about to make a suicide pass. Hockey lingo. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY feels </td>
   <td style="text-align:left;"> 2021-12-14 08:31:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY we all know how Powell and the Fed could be the deciding factor for market direction for the rest of the month. I want to put this into perspective: with 13 trading days left in the month, if spy closes below 455.59 on 12/31 the monthly candle for December is a bearish engulfing - after November was a gravestone doji. Food for thought 🔮🧙🏼‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 08:31:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ $SQQQ $DIA  

https://apple.news/A9UYr_fp3T4eacrtuNXP64A </td>
   <td style="text-align:left;"> 2021-12-14 08:30:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Ride the Alaskan Pipe Line 
https://youtu.be/0kCLNIKv2L8

Believe on Jesus for good times! </td>
   <td style="text-align:left;"> 2021-12-14 08:30:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Powell must first pull down all Taper before raising rates, not the combination of both. K.I.S.S. Approach applied. 

120/80/60 End of Tapering June/July ; maybe rate hike Q4 ‘22

On news, Melt Up ⬆️ +480-500 end year 🍺 </td>
   <td style="text-align:left;"> 2021-12-14 08:29:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY crap to 462.2ish at open to gap up and a massive run to inch near $500 eoy let’s see if jpow can clutch this  
 
jesus take the wheel I’ll be on the lookout for some cheap calls </td>
   <td style="text-align:left;"> 2021-12-14 08:29:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Funny that nobody is talking about what’s happening in CHY-NA </td>
   <td style="text-align:left;"> 2021-12-14 08:28:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $DIA $QQQ $SPY $IWM this is where it boutta get really ugly, once again.... red by morning. </td>
   <td style="text-align:left;"> 2021-12-14 08:28:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AAPL $QQQ $SPY $IWM jerome saw the market today </td>
   <td style="text-align:left;"> 2021-12-14 08:28:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY bears when they realize they bought puts a day too early 🤣🤣 </td>
   <td style="text-align:left;"> 2021-12-14 08:28:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $XLF $JPM $GS $SPY 
Who bought calls ?? I did </td>
   <td style="text-align:left;"> 2021-12-14 08:27:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Will new Covid Millionaires break out of the control bubble OR will they continue to buy $12 burrito NFTs for $120..I just read and react 😇 HOLDS? 👉 All time lows only and selling calls..donating most profits to link on page, buying Texas and game planning taxes 😁 LFG and all the emojis 👌 FUN either way 🥳  win/WIN trading cap rates we shall seeeeee! 🍀✌️ </td>
   <td style="text-align:left;"> 2021-12-14 08:27:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Jerome to Biden: rate hikes or lockdowns to control inflation, pick your poison. </td>
   <td style="text-align:left;"> 2021-12-14 08:26:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $VIX yall see the 9ema cross the 20&amp;amp;50 ema to the upside? $SPY pain is coming! </td>
   <td style="text-align:left;"> 2021-12-14 08:26:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Limit up looking INCREASINGLY likely !!!

🙂🙂📈👍 </td>
   <td style="text-align:left;"> 2021-12-14 08:26:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY we know what happens when too many people buy puts. </td>
   <td style="text-align:left;"> 2021-12-14 08:26:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> gap up is not something we are looking forward to $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:26:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Everyone expects it; therefore most likely won’t get it 🧐 </td>
   <td style="text-align:left;"> 2021-12-14 08:25:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 
Emergency Rate Hike incoming </td>
   <td style="text-align:left;"> 2021-12-14 08:25:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY who here swinging puts ?  I am seeing tomorrow this drop another $4-5 with fed meeting and omicrons is back with more deaths. </td>
   <td style="text-align:left;"> 2021-12-14 08:25:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY https://twitter.com/adamscrabble/status/1354573132749795330?s=21 </td>
   <td style="text-align:left;"> 2021-12-14 08:24:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Triple top pattern, FOMC (Hawkish bet), and quad witching.

&amp;quot;Oh, but put to call ratio is imbalanced so market will rip.&amp;quot;

Nah. You&amp;#39;ve been conditioned, as bearish positions are paid handsomely on uncertainties and event days. </td>
   <td style="text-align:left;"> 2021-12-14 08:24:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY nobody cares about futes, they were up last night. Let the tutes have their fun. </td>
   <td style="text-align:left;"> 2021-12-14 08:24:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY LOL! </td>
   <td style="text-align:left;"> 2021-12-14 08:23:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Futures up…why? </td>
   <td style="text-align:left;"> 2021-12-14 08:23:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Kamala charging an electric car: “there are no fumes”….

No shit. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY SOXS may go gangbusters, crypto heavy sell off. Cheap mining parts may flood the market for Christmas time. GPU&amp;#39;s are ridiculously expensive right now and the bottom may very well fall out. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $AAPL $MSFT $TSLA $AMZN Fed meeting tomorrow and Omicron is back with more deaths. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 472 confirmed tomorrow. This gonna swing like a sine wave until thursday </td>
   <td style="text-align:left;"> 2021-12-14 08:23:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Bet you dint know dat. Definition of the day. 

https://youtu.be/7PmIJd0ClMw

Believe on Jesus for you salvation. </td>
   <td style="text-align:left;"> 2021-12-14 08:22:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Moody’s says the Fed’s FOMC will be walking a fine and dangerous line this week (preview) $SPY https://www.billionaireclubcollc.com/moodys-says-the-feds-fomc-will-be-walking-a-fine-and-dangerous-line-this-week-preview/ </td>
   <td style="text-align:left;"> 2021-12-14 08:22:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY What&amp;#39;s everyone&amp;#39;s YTD return %? </td>
   <td style="text-align:left;"> 2021-12-14 08:21:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY am I doing charts right? </td>
   <td style="text-align:left;"> 2021-12-14 08:21:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY . </td>
   <td style="text-align:left;"> 2021-12-14 08:21:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY poem: 

Fuck </td>
   <td style="text-align:left;"> 2021-12-14 08:21:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $BTC.X same market scare stories that made me get out of equities are now plaguing crypto. People love playing into headlines. If this is start of bearish market… it would be 1 out of 1000s of times claimed $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:21:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY . </td>
   <td style="text-align:left;"> 2021-12-14 08:20:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY gains All the way with this channel!! 💚 💚 I am recommending you guys about this do chck them out!! Link in Bio $SHIB.X $LCID </td>
   <td style="text-align:left;"> 2021-12-14 08:20:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $MIND $5 coming on bevy news $BFRI $DWAC $SPY $QQQE </td>
   <td style="text-align:left;"> 2021-12-14 08:20:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:19:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY China 🇨🇳 will continue to 💩 the 🛏 </td>
   <td style="text-align:left;"> 2021-12-14 08:19:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY -- No reason to hold a position prior to Fed announcement -- just wait </td>
   <td style="text-align:left;"> 2021-12-14 08:19:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Poem:
Roses are Red 
Violets are blue 
Bulls are low IQ
Buy this dip
And you will be too. </td>
   <td style="text-align:left;"> 2021-12-14 08:19:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY auuu my SWING PUTS were golden💰💸 from Friday and good thing they don&amp;#39;t exp until DEC 17, so no rush to close all them out... I love it when an OBVIOUS plan comes together🤑.. Bulls are perplexed and got hot coals 🔥raked across their backs.. 🙃🥵😂 
PUTS PRINTING 💦💦💦👱‍♀️

Told yall $AAPL was a clear target Friday and over the weekend, $TSLA couldn&amp;#39;t hold $1000 signaling massive dump to come to low $900s, $PTON saved temporarily by technicals and value flow of Covid plays $QQQ will be taken to the woodshed 🤣 OOF! 

(TAPER TAPER TAPER RATE HIKE RATE HIKE RATE HIKE⬆️⬆️⬆️ 😆🙋🎯📉) FUTURES smell like vinegar and ammonia for bulls ☢😁 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Poem #2:

Bull is good
Bear is bad
Bull is happy
Bear is sad

Bull makes money
Bear has none
Bull is a hoot
Bear is no fun

- Torro 12/13/21

🙂🙂📈👍 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $TSLA $AAPL $QQQ $NDX . </td>
   <td style="text-align:left;"> 2021-12-14 08:18:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY futures going a bit crazy but doesnt change the fact its under the resistance line making it bearish. we turn bullish once over 469.77 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Wednesday will be like.. Rate hike or Hyperinflation?

Red light /  green light </td>
   <td style="text-align:left;"> 2021-12-14 08:18:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY its really about the truth. Truth is we are screwed.  Thanks to all the dems who voted for dems which want socialism then communism.  Put your faith in God not the world ,anyone or thing in it.🙏 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $UVXY $SPY RIP for the markets tomorrow. Bitcorn is falling like a rock </td>
   <td style="text-align:left;"> 2021-12-14 08:17:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $468+ tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:16:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Investors have yanked $558m from the funds in December, taking the total outflows over the past five months to $6.5bn, according to Morningstar. 
ARKK&amp;#39;s money-weighted returns are now negative. </td>
   <td style="text-align:left;"> 2021-12-14 08:16:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AMC Keep buying the dips. Oh wait this isn&amp;#39;t $SPY my bad. </td>
   <td style="text-align:left;"> 2021-12-14 08:16:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Is favouring to be pulling back against the September 2020 low right now, we don’t like to sell it, we like to look for the areas where buyers can enter for a bounce.  It is also sideways right now like many other instruments in the marketplace.  It is important to trade only the extreme areas and not trade the middle areas. #elliottwave #stocks </td>
   <td style="text-align:left;"> 2021-12-14 08:16:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> US Senator Manchin and US President Biden had a ‘productive’ conversation on Monday $SPY $QQQ https://www.billionaireclubcollc.com/us-senator-manchin-and-us-president-biden-had-a-productive-conversation-on-monday/ </td>
   <td style="text-align:left;"> 2021-12-14 08:15:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $spy 468* tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:15:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY candi corn variant and fed shitting on the world. Enjoy those calls 🐂 </td>
   <td style="text-align:left;"> 2021-12-14 08:15:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY How long do the sheep plan on putting up with this tyrannical nonsense?  Remember you have the power, they don’t.  All you have to do is resist. </td>
   <td style="text-align:left;"> 2021-12-14 08:15:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY lol almost 472 premarket down $5+ since and bulls hyping .70 cent after market bahahaha </td>
   <td style="text-align:left;"> 2021-12-14 08:14:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Here is a nice poem I just wrote:

Bear has no money
Unless he stole
Bear is not funny
Bear has no soul

🙂🙂📈👍 </td>
   <td style="text-align:left;"> 2021-12-14 08:14:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY how today feels </td>
   <td style="text-align:left;"> 2021-12-14 08:14:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY no good is about to come from this😂😂 </td>
   <td style="text-align:left;"> 2021-12-14 08:13:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Tomorrow it&amp;#39;s up 6 points 🙃 </td>
   <td style="text-align:left;"> 2021-12-14 08:13:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY hahahahahahahahha </td>
   <td style="text-align:left;"> 2021-12-14 08:13:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $spy it&amp;#39;s a gloomy December, but it&amp;#39;s just difficult to square the circle and join in on the doom. </td>
   <td style="text-align:left;"> 2021-12-14 08:12:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY darkpool continues to buy.. #DIX printed 47 again today. Wow.😱 </td>
   <td style="text-align:left;"> 2021-12-14 08:12:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY looking like 467.50 by close...AH is killing it </td>
   <td style="text-align:left;"> 2021-12-14 08:12:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Looks like the market is taking back the gains made last December. What am I missing? Rates will eventually go up. 2022 will def be bullish. Don’t buy Chinese stocks. $NAKD $IWM $SNDL $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:11:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY stifel said today sp500 is going to 6750 and  nasdaq 25000 in the mother of all bubbles.  The bubble hasn’t even started.  Get ready to double your money!  I may retire at that point. </td>
   <td style="text-align:left;"> 2021-12-14 08:11:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Invest in $SPY or active funds?

https://youtu.be/pg5LE-qPD9I </td>
   <td style="text-align:left;"> 2021-12-14 08:11:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Protect your Capital Bulls, don’t trade at all stop trying to force the market to be bullish when it can’t ! </td>
   <td style="text-align:left;"> 2021-12-14 08:10:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Bulls some solid advice from a good hearted Bear here, sometimes the best Trade to make is to not Trade at all. how about y’all come back after all these Omnicrom news and FED meeting stuff is over </td>
   <td style="text-align:left;"> 2021-12-14 08:09:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Unless you’re a boomer and been holding stonks since 1960’s or Apple since 0.50 cents you shouldn’t be holding anything overnight unless it’s a short or longer term put. </td>
   <td style="text-align:left;"> 2021-12-14 08:08:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $QQQ $SPY $AAPL CNBC: Morgan Stanley CEO Gorman calls for the Fed to raise interest rates soon.
https://www.cnbc.com/2021/12/13/morgan-stanley-ceo-gorman-calls-for-the-fed-to-raise-interest-rates-soon.html </td>
   <td style="text-align:left;"> 2021-12-14 08:08:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Great day gang 👍 I want to give every bear one of these 🍭 </td>
   <td style="text-align:left;"> 2021-12-14 08:08:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY It’s called, “tuck your dick in Tuesday.” </td>
   <td style="text-align:left;"> 2021-12-14 08:08:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY not enough of my black brothers and sisters invest </td>
   <td style="text-align:left;"> 2021-12-14 08:08:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> From a business business trip to Alaska, I learned that people here really have a great sense of humor. 
The only correct way to use bathroom here is to be a human, not peek into other peoples&amp;#39; stalls, and to not be a moose. It&amp;#39;s that simple!  
  
$AAPL $TSLA $SPY $AMD $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 08:08:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 🤠 </td>
   <td style="text-align:left;"> 2021-12-14 08:07:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY JP has got to sacrifice a bull or 2 at the altar, the market is indefensible as is. With the dollar still ripping somebody knows something, I say buy Chinese securities and stay cash rich for the next bit. </td>
   <td style="text-align:left;"> 2021-12-14 08:07:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM Powel won&amp;#39;t care about the markets tantrum this time. He is loosing control of the whole economy. It feels like this is the most unpredictable FED meeting this year. </td>
   <td style="text-align:left;"> 2021-12-14 08:07:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY People need to stop bringing up their experiment status into conversations.  It&amp;#39;s your business and I don&amp;#39;t need to know. </td>
   <td style="text-align:left;"> 2021-12-14 08:06:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Paths to wealth $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:06:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY BEARS ALL NIGHT 👇 </td>
   <td style="text-align:left;"> 2021-12-14 08:06:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I made a meme. </td>
   <td style="text-align:left;"> 2021-12-14 08:06:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY DOJ targets hedge fund short sellers in criminal investigation over illegal short selling https://youtu.be/Ys4LBZ7OGLI </td>
   <td style="text-align:left;"> 2021-12-14 08:06:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY market selling off. Crypto selling off. Value of the dollar plummeting. 

So. What isn&amp;#39;t going down? </td>
   <td style="text-align:left;"> 2021-12-14 08:05:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY are futes ripping

🙂👍 </td>
   <td style="text-align:left;"> 2021-12-14 08:05:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY This guy is a professional trader. </td>
   <td style="text-align:left;"> 2021-12-14 08:05:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY “It’s not so much about me and my promise. It’s about allocating capital to God’s creation in the most innovative and creative way possible.” - Cathie (March, 2021) </td>
   <td style="text-align:left;"> 2021-12-14 08:05:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY BTC crash with rate hike might smack some sense into these bulls and we will deflate healthfully. </td>
   <td style="text-align:left;"> 2021-12-14 08:05:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY bears are done next week..3 bar play setting up on the weekly </td>
   <td style="text-align:left;"> 2021-12-14 08:04:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY How many envision Cathie&amp;#39;s $ARKK  will be out of business by Dec 31st </td>
   <td style="text-align:left;"> 2021-12-14 08:04:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Lets see why they call it “turnaround Tuesday“ </td>
   <td style="text-align:left;"> 2021-12-14 08:04:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY CNBC BREAKING NEWS
Jerome Powell spotted wearing Grinch costume at Morton&amp;#39;s Steakhouse in Manhattan . . . </td>
   <td style="text-align:left;"> 2021-12-14 08:03:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

I say don&amp;#39;t follow poor people. They don&amp;#39;t know.

Warren says:

“It’s better to hang out with people better than you. Pick out associates whose behavior is better than yours and you’ll drift in that direction.”

Make rich friends, and avoid the poor. </td>
   <td style="text-align:left;"> 2021-12-14 08:02:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY just from studying Natural gas historical (dot com, 08, 2018) market is about to absolutely dump. Check it and tell me what you think. Looks like the party is over. </td>
   <td style="text-align:left;"> 2021-12-14 08:02:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY BEARS WHAT HAPPENED TO THE CRASH ???!! </td>
   <td style="text-align:left;"> 2021-12-14 08:02:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY -- pump the overnight futures -- sell in the morning -- repeat ... </td>
   <td style="text-align:left;"> 2021-12-14 08:02:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY &amp;#39;sell the shitty ones now&amp;#39;... </td>
   <td style="text-align:left;"> 2021-12-14 08:01:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY your new god is here sup follow me I’m the next big thing like oldfngguy gfy </td>
   <td style="text-align:left;"> 2021-12-14 08:01:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $DWAC $SPY .. </td>
   <td style="text-align:left;"> 2021-12-14 08:01:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY The sinking ARKK 
https://www.ft.com/content/d26e8ee6-f724-4a7a-8cef-61bd5f101c28 </td>
   <td style="text-align:left;"> 2021-12-14 08:01:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> The 9th largest market cap $SPY </td>
   <td style="text-align:left;"> 2021-12-14 08:00:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $469 Open Tomorrow 🚀🚀🚀 </td>
   <td style="text-align:left;"> 2021-12-14 08:00:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY …although I don’t think $SPY will be at $481 by December 17th as the attached suggests, I do think we’re bound to go higher through month end regardless of the coming news cycles, especially this Wednesday.  
But what do I know.
GLTATraders, always </td>
   <td style="text-align:left;"> 2021-12-14 08:00:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $BYND  Bravo fake burger company up and so is this </td>
   <td style="text-align:left;"> 2021-12-14 08:00:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I could have told you West Side Story would bomb.  JC you couldn&amp;#39;t pay me to sit through that trash.  Spielberg has no close friends apparently to tell him hey uhhh yeah don&amp;#39;t remake corny ass 50&amp;#39;s musicals 🤢 </td>
   <td style="text-align:left;"> 2021-12-14 08:00:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY King is 💰 </td>
   <td style="text-align:left;"> 2021-12-14 07:58:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I&amp;#39;m going long after the rate hike dip. </td>
   <td style="text-align:left;"> 2021-12-14 07:58:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY SOXS trajectory looking serious. Looking for the big payout. </td>
   <td style="text-align:left;"> 2021-12-14 07:58:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY please explain to me how the less than 1% drop today is the same as the dot com bubble? Don&amp;#39;t see why people are comparing the two </td>
   <td style="text-align:left;"> 2021-12-14 07:58:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY probably can sell put spread below 4640.32 (S3) Dec 15 </td>
   <td style="text-align:left;"> 2021-12-14 07:58:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Blow it out your self serving ass Mars Boy Elon ... seek help idiot ... recent tweet by the marsass  ... &amp;quot;#Elon #Musk ... 
@elonmusk  1h  SpaceX is starting a program to take CO2 out of atmosphere &amp;amp; turn it into rocket fuel. Please join if interested.&amp;quot; ... $tsla $arkk $spy $qqq $SPX  https://mobile.twitter.com/elonmusk ... carry on sticking forks in this overpriced p o s TESLA for profits re due diligence  ... tdtiahth @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈✔ </td>
   <td style="text-align:left;"> 2021-12-14 07:58:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY https://youtu.be/U-Fe0KIbjd0 
 
listen before you make your next trade. Good luck everyone. </td>
   <td style="text-align:left;"> 2021-12-14 07:58:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY &amp;quot;Man whose wife won a lawsuit to treat his Covid-19 with ivermectin has died.&amp;quot;- Well, at least he didn&amp;#39;t from worms. $QQQ $MRNA $PFE </td>
   <td style="text-align:left;"> 2021-12-14 07:58:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I want to see red on the futes before 8PM. </td>
   <td style="text-align:left;"> 2021-12-14 07:58:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Puts are too expensive </td>
   <td style="text-align:left;"> 2021-12-14 07:57:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY McDonald’s bots in full force shame hiring degenerates lol </td>
   <td style="text-align:left;"> 2021-12-14 07:55:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> MORE DOWNSIDE COMING?

S&amp;amp;P 500 $SPY Analysis 👉 https://www.youtube.com/watch?v=uOZOuVDBYLw </td>
   <td style="text-align:left;"> 2021-12-14 07:55:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  Dollar continues it&amp;#39;s monster rip. Market is going to sell, for real this time. Best to sideline it for a bit. </td>
   <td style="text-align:left;"> 2021-12-14 07:55:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Look what happened to &amp;quot;buy the dip&amp;quot; crew, that wasn&amp;#39;t the actual dip and it fell even further </td>
   <td style="text-align:left;"> 2021-12-14 07:55:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  I can’t wait till next president hope he or she is republican </td>
   <td style="text-align:left;"> 2021-12-14 07:55:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ (OT) Yeah this WOKE WORLD is totally fair lollll 
What a ClownShow sheeeetFest

https://www.thecollegefix.com/female-upenn-swimmers-demoralized-no-matter-how-much-work-they-put-in-it-theyre-going-to-lose/

People are actually cheering this newly created Kaitlyn type of human on?????

Hey if you want to make the ultimate ‘change’ go right ahead…. (no one cares until…

…. you try participate in this kind of activity. )

The real fault falls on the Ri’tards who allow or fight for/ or defend this crap. 

NaturalBorn Gender rules must apply to certain aspects in Life. Use some common sense.

Most likely this trans Clown just wanted to prove a Title 9 point… but Title 9 gave Girls/Women a more equal share of $$$ for their sport budgets. Which was a very Good Thing.

Now the Dickless thinks he/she/it can have a winning moment while sheeeeting on others legit Dreams? 

Clue Up USA &amp;amp; World.

Sorry for the off topic rant but This Bush/Clinton/W Bush/Obama/Trump and now Biden Sheeeeet Show is quickly getting Worse. </td>
   <td style="text-align:left;"> 2021-12-14 07:55:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY When the markets and cryptos crash - the great resignation $hit will stop and people will go back to work and cities will be back to life. Economy will grow back </td>
   <td style="text-align:left;"> 2021-12-14 07:54:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY they keep the indexes at all time highs to disguise the dumpster fire that is the rest of the market. everything else at 52 week lows </td>
   <td style="text-align:left;"> 2021-12-14 07:54:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Apply the same concept here.

Every gamblers has a trading plan until they get wiped out in the market crash thinking they can time it and exit safely.

You going to get wrecked indefinitely Jr. </td>
   <td style="text-align:left;"> 2021-12-14 07:54:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY bulls looked stupid today!!! </td>
   <td style="text-align:left;"> 2021-12-14 07:54:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY There&amp;#39;s no such thing as Santa though. </td>
   <td style="text-align:left;"> 2021-12-14 07:53:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY How long is UK lockdown? $AAPL $NVDA </td>
   <td style="text-align:left;"> 2021-12-14 07:53:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY the best decisions I’ve consistently made is to not sell and buy the dip. </td>
   <td style="text-align:left;"> 2021-12-14 07:53:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $SPX YOU PEARS ARE RIDE PR DIE KINDA GROUP </td>
   <td style="text-align:left;"> 2021-12-14 07:53:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  your democratic stock Market </td>
   <td style="text-align:left;"> 2021-12-14 07:53:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

-5% week book it </td>
   <td style="text-align:left;"> 2021-12-14 07:52:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Retail Sell All, buy back lower 15% $AAPL $TSLA $AMD </td>
   <td style="text-align:left;"> 2021-12-14 07:52:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY The UK covid chart. The resulting lockdowns will continue to damage the economy. I won&amp;#39;t comment on the &amp;quot;why&amp;quot; this chart is happening. </td>
   <td style="text-align:left;"> 2021-12-14 07:52:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Don&amp;#39;t be suprised when volatility spikes. </td>
   <td style="text-align:left;"> 2021-12-14 07:52:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY So fuck you’re puts 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 07:52:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY News Flash: The Spy isn’t falling. 

ATH’s again this week. </td>
   <td style="text-align:left;"> 2021-12-14 07:52:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $SPX $QQQ $DIA $ES_F 

I take a 10% hit to avoid 50% loss 

Any day of the week  🧞‍♂️🎄 </td>
   <td style="text-align:left;"> 2021-12-14 07:52:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  sell it all fk it </td>
   <td style="text-align:left;"> 2021-12-14 07:52:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

The first day of The Great Reset </td>
   <td style="text-align:left;"> 2021-12-14 07:51:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:51:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Sniff the snow and wait till 12.

Your nose will bleed just like the futes. </td>
   <td style="text-align:left;"> 2021-12-14 07:51:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY cuck em who buy em </td>
   <td style="text-align:left;"> 2021-12-14 07:51:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $SPX JMJ </td>
   <td style="text-align:left;"> 2021-12-14 07:50:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $SPX Jesus Mary and Joseph </td>
   <td style="text-align:left;"> 2021-12-14 07:50:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Perma bulls are institutionalised in buying the dip </td>
   <td style="text-align:left;"> 2021-12-14 07:50:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY ath tomorrow they said. Cuck em </td>
   <td style="text-align:left;"> 2021-12-14 07:50:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

There will be no V.

Fed chair has moral obligation to turn off printer leading into FOMC. </td>
   <td style="text-align:left;"> 2021-12-14 07:50:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $ES_F $SPX $SPY $QQQ $NDX 🧞‍♂️
I like to point out if I even get the feeling my new calls going to go red I’m dumping them immediately 

Just keeping this real for y’all </td>
   <td style="text-align:left;"> 2021-12-14 07:50:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY FuTeS sLiPPiN </td>
   <td style="text-align:left;"> 2021-12-14 07:49:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $Spy $PLTR $TLRY $SPCE 
So they obviously want us to think spy almost ath and sht stocks pounded what if the spy decides to really fade? 
That’s not how it works, obviously growth stocks were hammered in the early spring after stimulus. So naturally $ should iMO rotate when infrastructure bull passed. </td>
   <td style="text-align:left;"> 2021-12-14 07:49:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY it will open at $468 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 07:49:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Whats going on in here ? </td>
   <td style="text-align:left;"> 2021-12-14 07:49:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY wheres Pajama Trader?? </td>
   <td style="text-align:left;"> 2021-12-14 07:49:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $AMC I thought this was a movie company? Why is it&amp;#39;s main revenue hopium? $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:49:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY 

Nq will sell off tomorrow.

Don&amp;#39;t fight it, let it be. </td>
   <td style="text-align:left;"> 2021-12-14 07:48:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY Bullish - Go America!!! </td>
   <td style="text-align:left;"> 2021-12-14 07:48:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $ES_F $SPX $QQQ $NDX 🧞‍♂️

Experimenting with calls here 🧞‍♂️

Just bought across the board 

Just experiments  Mega Win Possible </td>
   <td style="text-align:left;"> 2021-12-14 07:48:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $TSLA 
https://youtu.be/xB11j91tWvw </td>
   <td style="text-align:left;"> 2021-12-14 07:48:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ think we go lower to 900 before we reach ath 
 
needs to finish this abc correction  
 
need to see what happens wednesday  
 
opex is friday </td>
   <td style="text-align:left;"> 2021-12-14 07:47:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY  sold headed over to crypto sht is boring </td>
   <td style="text-align:left;"> 2021-12-14 07:47:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Do you guys remember the stat from 2020 that 90% of that years gains were all after hours in the futures session. It is stunning that futures can never been red. 
 
$spy $qqq </td>
   <td style="text-align:left;"> 2021-12-14 07:46:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY I love how these bulls over the weekend with their weekly or 0DTE calls and went in balls to the wall have gone radio silent today. Bulls slowly starting to figure out that J. Powell is no longer your friend. Market is up over 100% from market lows, money isn’t going to be so easy anymore. Look at all the hyper growth stocks down 50/60/75 % so many covid traders who entered the market have been wiped out already. You cocky bulls are about to get fCkin humbled, those of you that are left anyway.. </td>
   <td style="text-align:left;"> 2021-12-14 07:46:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> January dividend players $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:46:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY falling asleep while playing a very fun game- need a nap </td>
   <td style="text-align:left;"> 2021-12-14 07:46:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $SPX $ES_F $QQQ $DIA 🧞‍♂️ UPDATE

If you think the Powel will RUIN United States 🇺🇸 Citizens 401k’s days before Christmas and New Years you got to be the stupidest traders around </td>
   <td style="text-align:left;"> 2021-12-14 07:45:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> This market is causing a lot of social media influencers with 7 fighters or more to start scaling out of their stock holdings I’m noticing $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:45:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> Buy Gold?? $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:45:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY anything spreading fast is always dangerous...many have underestimated yet

https://ktvz.com/health/cnn-health/2021/12/13/omicron-is-spreading-fast-thats-alarming-even-if-its-mild/ </td>
   <td style="text-align:left;"> 2021-12-14 07:45:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY omg spy isn&amp;#39;t at ATH omg everyone panic </td>
   <td style="text-align:left;"> 2021-12-14 07:44:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY puts printing this week? </td>
   <td style="text-align:left;"> 2021-12-14 07:44:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $VIX </td>
   <td style="text-align:left;"> 2021-12-14 07:44:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY A gentle reminder from one of the millions who resent the hell out of being locked down and forced to wear masks and get shots all because of one political party.  I remember this stuff.  I vote.  Get your mfing masks on for the rest of your life and stfu now dems.  JC you absolute clowns. 

I&amp;#39;ll never ever forget who cratered me for going on two years for a completely hyped micro pandemic, set my kids&amp;#39; development back and scared them for no good reason, sold my wage power and my citizenship&amp;#39;s value out to illegals, who calls me a deplorable clinger racist etc.  There.  are.  millions.  Of disenfranchised folks like me.  I used to vote democrat is the irony.  

Dems shedding American voters so they just turn Mexicans into voters.  Voila.  It&amp;#39;s gross.  Between covid, the failed state developing at the border, the profligate spending, the weakness signaled to our enemies, the woke turds in the toilet, who tf could possibly be voting for this?  Election was synthetic guys.  Thanks. </td>
   <td style="text-align:left;"> 2021-12-14 07:44:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY weeee go red with Chaina open. Evergrande, you better not let ze bears down </td>
   <td style="text-align:left;"> 2021-12-14 07:43:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPY </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $STWIT.P please report this person for impersonation and harassment.  It’s my name but with two “r”. Thanks </td>
   <td style="text-align:left;"> 2021-12-14 07:43:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM 
How strong will the bounce be? I say about 1.5 to 2% tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 09:02:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ if you voted for him, I hope you go broke. </td>
   <td style="text-align:left;"> 2021-12-14 09:00:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 

https://www.reddit.com/r/Wallstreetsilver/comments/rfuft4/peter_schiff_getting_the_truth_outinflation/

... </td>
   <td style="text-align:left;"> 2021-12-14 08:59:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ less air </td>
   <td style="text-align:left;"> 2021-12-14 08:58:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $SNOW $TSLA $IWM  🔥🔥🔥🥵 Just  started the 🩸 </td>
   <td style="text-align:left;"> 2021-12-14 08:52:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $IWM $SPY $QQQ So 37 NFL players tested positive for Covid today, which I believe is a high on positive tests. I do think this micro environment also represents the macro environment, meaning the U.S etc etc, expect more covid BS in the coming days. Fed, covid, we just need a war right now for the cherry on the top. </td>
   <td style="text-align:left;"> 2021-12-14 08:52:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $UVXY until Banks can put in a reversal of more than one day there&amp;#39;s no need to be bullish on this Market tech is crushed and banks are crushed what the hell are you freaking bullish about lol?. $SPY $QQQ $XBI $XLF </td>
   <td style="text-align:left;"> 2021-12-14 08:51:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $IWM 

Stock futures tick higher ahead of key inflation data, Fed meeting https://www.cnbc.com/2021/12/13/stock-market-futures-open-to-close-news.html?__source=iosappshare%7Ccom.apple.UIKit.activity.CopyToPasteboard </td>
   <td style="text-align:left;"> 2021-12-14 08:51:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ Ladies and gentlemen,  we have another fake pump happening in futures now.
PAIN IS COMING 
and it&amp;#39;s just around the corner 🔻🔻🔻✌ </td>
   <td style="text-align:left;"> 2021-12-14 08:50:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $DWAC $SPY $QQQ  this. </td>
   <td style="text-align:left;"> 2021-12-14 08:50:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ bears are about to take a big fat dookie right on bulls faces.  Completely inflated market and once people realize inflation is going to run to 30% bye bye all time highs for years </td>
   <td style="text-align:left;"> 2021-12-14 08:49:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ Futures up, as of now it looks like we will see a green day tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:47:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $IWM $QQQ $SPY $AMZN powell is watching ya bears be careful </td>
   <td style="text-align:left;"> 2021-12-14 08:45:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $DIA $QQQ $SPY and the best part is theres nothing any of you can do about it! Lmfao, go get jobs get into the real world instead of trying to support yourselves off your lil puny stock accounts. Bums </td>
   <td style="text-align:left;"> 2021-12-14 08:45:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA 
No way Brandon &amp;amp; JPow gonna crash the market right before Christmas.. &amp;quot;c&amp;#39;mon man&amp;quot;. </td>
   <td style="text-align:left;"> 2021-12-14 08:45:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> US small-cap stocks trade at historic discount to corporate titans

$SPY $IWM $SP600 $QQQ 

https://www.ft.com/content/a894adff-7ca2-4fdc-bc85-c43bc2c53491 </td>
   <td style="text-align:left;"> 2021-12-14 08:43:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $AMC $GME $BTC.X all the degenerates should be thankful the losses are coming on this side of New Years so you can offset your losses against your gains from earlier in the year (if you had any) </td>
   <td style="text-align:left;"> 2021-12-14 08:37:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $ES_F $SPX $SPY  🧞‍♂️

Yeah, this is a Mega Short Squeeze in Progress right now 

Just like last night $QQQ $DIA In Progress </td>
   <td style="text-align:left;"> 2021-12-14 08:37:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $IWM BEARS </td>
   <td style="text-align:left;"> 2021-12-14 08:35:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  $SQQQ $SOXS $FNGD this is a monthly chart if you are bullish and not terrified you need to rethink a few things about investing. </td>
   <td style="text-align:left;"> 2021-12-14 08:35:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY Former US Treasury Secretary Summers calls on 4 rate hikes by Fed next year. He sees inflation and overextended markets as major risks to the economy in 2022. </td>
   <td style="text-align:left;"> 2021-12-14 08:34:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $NASDAQ  bulls have to know what the economy is doing, the market is running on no major catalyst other then overinflation from powell printing money out of his ass, which mms might just be upping to trap people into a fucked up crash. Two new variants of the virus with no bio tech reports? Thats suspect! Powell raising interest rates and considering how much borrowed money is in the stock market and crypto, people tend to withdraw that borrowed money as the fed raises interest rates. This market is a floating donkey ready to bust at any single catalyst that has the slight of hand to crash this to the floor. I think this is a setup to trap every investment and drop it to the fucking floor with one big press release. Just my opinion. And judging by alot of the permabulls in current market conditions they’re will be a quick mood swing from happy pump to market in shreds. Permabulls will cry themselves to sleep for months wondering how they are gonna afford rent. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA 🎯👇

https://www.msn.com/en-us/money/markets/billionaire-investor-bill-ackman-says-inflation-is-being-underreported-by-the-government-due-to-soaring-rent-costs/ar-AARLKsE?ocid=msedgntp </td>
   <td style="text-align:left;"> 2021-12-14 08:32:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA $AAPL $SPY $QQQ $DIA  

https://apple.news/AVSGYxVxYQmWGVFiB5JXQZQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $spy $qqq futures about to make a suicide pass. Hockey lingo. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ $SQQQ $DIA  

https://apple.news/A9UYr_fp3T4eacrtuNXP64A </td>
   <td style="text-align:left;"> 2021-12-14 08:30:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $DIA $QQQ $SPY $IWM this is where it boutta get really ugly, once again.... red by morning. </td>
   <td style="text-align:left;"> 2021-12-14 08:28:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $QQQ $SPY $IWM jerome saw the market today </td>
   <td style="text-align:left;"> 2021-12-14 08:28:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY auuu my SWING PUTS were golden💰💸 from Friday and good thing they don&amp;#39;t exp until DEC 17, so no rush to close all them out... I love it when an OBVIOUS plan comes together🤑.. Bulls are perplexed and got hot coals 🔥raked across their backs.. 🙃🥵😂 
PUTS PRINTING 💦💦💦👱‍♀️

Told yall $AAPL was a clear target Friday and over the weekend, $TSLA couldn&amp;#39;t hold $1000 signaling massive dump to come to low $900s, $PTON saved temporarily by technicals and value flow of Covid plays $QQQ will be taken to the woodshed 🤣 OOF! 

(TAPER TAPER TAPER RATE HIKE RATE HIKE RATE HIKE⬆️⬆️⬆️ 😆🙋🎯📉) FUTURES smell like vinegar and ammonia for bulls ☢😁 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $TSLA $AAPL $QQQ $NDX . </td>
   <td style="text-align:left;"> 2021-12-14 08:18:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ how quickly things change but that&amp;#39;s ok, we adapt! Breakdown from our box consolidation from todays lows will prompt a short entry targeting the gap fill at 387. Next target after that will be 379 area. </td>
   <td style="text-align:left;"> 2021-12-14 08:17:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> US Senator Manchin and US President Biden had a ‘productive’ conversation on Monday $SPY $QQQ https://www.billionaireclubcollc.com/us-senator-manchin-and-us-president-biden-had-a-productive-conversation-on-monday/ </td>
   <td style="text-align:left;"> 2021-12-14 08:15:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $AAPL CNBC: Morgan Stanley CEO Gorman calls for the Fed to raise interest rates soon.
https://www.cnbc.com/2021/12/13/morgan-stanley-ceo-gorman-calls-for-the-fed-to-raise-interest-rates-soon.html </td>
   <td style="text-align:left;"> 2021-12-14 08:08:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM Powel won&amp;#39;t care about the markets tantrum this time. He is loosing control of the whole economy. It feels like this is the most unpredictable FED meeting this year. </td>
   <td style="text-align:left;"> 2021-12-14 08:07:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Blow it out your self serving ass Mars Boy Elon ... seek help idiot ... recent tweet by the marsass  ... &amp;quot;#Elon #Musk ... 
@elonmusk  1h  SpaceX is starting a program to take CO2 out of atmosphere &amp;amp; turn it into rocket fuel. Please join if interested.&amp;quot; ... $tsla $arkk $spy $qqq $SPX  https://mobile.twitter.com/elonmusk ... carry on sticking forks in this overpriced p o s TESLA for profits re due diligence  ... tdtiahth @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈✔ </td>
   <td style="text-align:left;"> 2021-12-14 07:58:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY &amp;quot;Man whose wife won a lawsuit to treat his Covid-19 with ivermectin has died.&amp;quot;- Well, at least he didn&amp;#39;t from worms. $QQQ $MRNA $PFE </td>
   <td style="text-align:left;"> 2021-12-14 07:58:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  blipp hmmm </td>
   <td style="text-align:left;"> 2021-12-14 07:56:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ (OT) Yeah this WOKE WORLD is totally fair lollll 
What a ClownShow sheeeetFest

https://www.thecollegefix.com/female-upenn-swimmers-demoralized-no-matter-how-much-work-they-put-in-it-theyre-going-to-lose/

People are actually cheering this newly created Kaitlyn type of human on?????

Hey if you want to make the ultimate ‘change’ go right ahead…. (no one cares until…

…. you try participate in this kind of activity. )

The real fault falls on the Ri’tards who allow or fight for/ or defend this crap. 

NaturalBorn Gender rules must apply to certain aspects in Life. Use some common sense.

Most likely this trans Clown just wanted to prove a Title 9 point… but Title 9 gave Girls/Women a more equal share of $$$ for their sport budgets. Which was a very Good Thing.

Now the Dickless thinks he/she/it can have a winning moment while sheeeeting on others legit Dreams? 

Clue Up USA &amp;amp; World.

Sorry for the off topic rant but This Bush/Clinton/W Bush/Obama/Trump and now Biden Sheeeeet Show is quickly getting Worse. </td>
   <td style="text-align:left;"> 2021-12-14 07:55:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $SPX $QQQ $DIA $ES_F 

I take a 10% hit to avoid 50% loss 

Any day of the week  🧞‍♂️🎄 </td>
   <td style="text-align:left;"> 2021-12-14 07:52:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $ES_F $SPX $SPY $QQQ $NDX 🧞‍♂️
I like to point out if I even get the feeling my new calls going to go red I’m dumping them immediately 

Just keeping this real for y’all </td>
   <td style="text-align:left;"> 2021-12-14 07:50:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  he’ll why not everyone just pull there money out call it a week </td>
   <td style="text-align:left;"> 2021-12-14 07:49:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $ES_F $SPX $QQQ $NDX 🧞‍♂️

Experimenting with calls here 🧞‍♂️

Just bought across the board 

Just experiments  Mega Win Possible </td>
   <td style="text-align:left;"> 2021-12-14 07:48:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $TSLA 
https://youtu.be/xB11j91tWvw </td>
   <td style="text-align:left;"> 2021-12-14 07:48:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ think we go lower to 900 before we reach ath 
 
needs to finish this abc correction  
 
need to see what happens wednesday  
 
opex is friday </td>
   <td style="text-align:left;"> 2021-12-14 07:47:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Do you guys remember the stat from 2020 that 90% of that years gains were all after hours in the futures session. It is stunning that futures can never been red. 
 
$spy $qqq </td>
   <td style="text-align:left;"> 2021-12-14 07:46:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $SPX $ES_F $QQQ $DIA 🧞‍♂️ UPDATE

If you think the Powel will RUIN United States 🇺🇸 Citizens 401k’s days before Christmas and New Years you got to be the stupidest traders around </td>
   <td style="text-align:left;"> 2021-12-14 07:45:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ new ath incoming </td>
   <td style="text-align:left;"> 2021-12-14 07:45:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $VIX </td>
   <td style="text-align:left;"> 2021-12-14 07:44:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA $STWIT.P please report this person for impersonation and harassment.  It’s my name but with two “r”. Thanks </td>
   <td style="text-align:left;"> 2021-12-14 07:43:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY hope it crashes here but 

The fed will never ruin Christmas and New Years that’s almost 100% for sure 

 🧞‍♂️😎 Buy accordingly $SPX $QQQ $ES_F </td>
   <td style="text-align:left;"> 2021-12-14 07:40:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ why everyone is bearish here??? </td>
   <td style="text-align:left;"> 2021-12-14 07:39:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $spy $qqq well overnight big green turn out red as predicted 😂 Told h </td>
   <td style="text-align:left;"> 2021-12-14 07:38:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> The Dot Com bubble didn’t kill the internet, contrary in fact. The internet obviously became a necessary part of our lives. But the crash still utterly wiped out a lot of people. Same could happen here. Blockchain seems inevitable in some way. Endless profits on crypto - a by product of Fed money printing and too much liquidity - is not. $BTC.X $ETH.X $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 07:37:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ let’s go Brandon! </td>
   <td style="text-align:left;"> 2021-12-14 07:35:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $AAPL $QQQ Smack .. the San Francisco treat. The city’s data reveals there were a total of 713 overdose deaths, compared to 261 COVID-19 deaths in 2020.

“Bad is an understatement. I would say it’s horrific, it is negligent, it is an epidemic in and of itself, and it was not always this way,” Jenny Shao, a freelance multimedia video journalist and San Francisco native, told NTD Television.

“Before, you were able to walk through the streets … and you did not have to try and tiptoe over bodies not knowing whether they were dead or alive.” Shao said.

Shao continued, “And, also, you did not have to hopscotch through anything like drug paraphernalia … and you were not literally walking through a scene, of say, ‘The Night of the Living Dead,’” Shao said.

One drug addict’s mother has described it as a “Zombie Apocalypse.” Her 32-year-old son is addicted to fentanyl, which has left him homeless and physically “bent over” so that he “walks like an old man.”
….

USA a 3rd World Country?? </td>
   <td style="text-align:left;"> 2021-12-14 07:33:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $386 next </td>
   <td style="text-align:left;"> 2021-12-14 07:33:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ all the sheeple are piled into this like sardines ! The drop will be epic .  The liquidity trap is being laid . </td>
   <td style="text-align:left;"> 2021-12-14 07:29:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA Investment Bank Stifel says that the Fed is going to have to attack the inflation problem hard in order to contain it

They say a &amp;quot;populist Fed&amp;quot; got us into an inflationary cycle to begin with and has demonstrated &amp;quot;poor monetary and fiscal decisions since the beginning of Covid&amp;quot; </td>
   <td style="text-align:left;"> 2021-12-14 07:29:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM $DIA 
As expected last week was a break from the “Fed” news and this week selling cuz of the “Fed” news that will be announced on the 15th. But we already know what they’re gonna do, but they probably have Algos selling til the 15th… sure is a long as weekend </td>
   <td style="text-align:left;"> 2021-12-14 07:26:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM $XBI  Just as predicted last week, we are starting to go down, but we are still in a shopshop mode. We will likely bounce up tomorrow and Wednesday morning and go down at the end of the week. $SPY is the strongest, and $QQQ and $IWM seem to be the weakest. Expect $QQQ to get to 370 and $IWM to 210 before we get a real rally. I don&amp;#39;t see a rally from this point; I may be wrong of course. </td>
   <td style="text-align:left;"> 2021-12-14 07:26:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY gap fill imminent.  Also 449 in play. Could get ugly. $DIA $AAPL $QQQ $BTC.X </td>
   <td style="text-align:left;"> 2021-12-14 07:25:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Elon pumps are done ! </td>
   <td style="text-align:left;"> 2021-12-14 07:25:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $SPX $IWM $DIA  
 
I find it funny that people are concerned *now* about inflation.  What did you expect? 
     
They started printing 4,000,000,000 (4 billion) per DAY, almost 2 years ago.  1 million per SECOND (for 2 years).  Heck, all sorts of non-profits were considered &amp;quot;businesses&amp;quot;.  Churches/religious institutions ALONE got $18,000,000,000.   Millions of shell and non-operating companies got free money.  Of the &amp;quot;small business aid&amp;quot; program totaling 870 billion, 10%, or 87,000,000,000 were outright fraudulent (according to the government.  and 95% will never be recouped).   nearly 100 BILLION in fraud.  It&amp;#39;s ridiculous.  And then there&amp;#39;s all the unemployment benefits.  checks.  etc etc etc.  
  
My point is, it&amp;#39;s not an accident.  This inflationary hysteria was planned long in advance.  And just because you can &amp;quot;beat it (inflation)&amp;quot;,  doesn&amp;#39;t mean it&amp;#39;s healthy.   
  
Get out while you can. </td>
   <td style="text-align:left;"> 2021-12-14 07:25:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> MOVES HAPPENING NOW (6:24pm)

⦿ $QQQ is down 0.0% in the last 5 mins. 

⦿ There are 4 stocks that are up more than 3% in the last 5 mins. 

⦿ The top gainer is up 8.1% in the last 5 mins. 

 See the stocks that are moving the most right now via link in bio (wallstreetodds .com). </td>
   <td style="text-align:left;"> 2021-12-14 07:24:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA I think we should gap up $300-$500 

Tomorrow for man of the year Elan Musk 

 🧞‍♂️😎 $SPY $SPX $ES_F $QQQ  😎🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 07:24:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Last week’s attempted rally was indeed a fake out. Seasoned investors cautioned this all along.

If J Powell speaks to increasing rate hikes at Wednesday’s meeting, things could really get ugly.

I’m being cautious, defensive, and focused on raising cash for now.

$DIA $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 07:20:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY how many decades of evidence will it take for people to realize there’s zero correlation between futures and next days close? </td>
   <td style="text-align:left;"> 2021-12-14 07:20:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ is currently trading in the upper part of its 52 week range, slightly lagging the index. https://www.chartmill.com/stock/analyzer/stock/QQQ?key=d8dac8fb-a874-4422-96db-185a5752c108&amp;amp;utm_source=stocktwits&amp;amp;utm_medium=TA&amp;amp;utm_content=QQQ&amp;amp;utm_campaign=social_tracking </td>
   <td style="text-align:left;"> 2021-12-14 07:16:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ People are just plain stupid when it comes to investing now...Your pumps will not last.. Bad news on the horizon say tuned! Should see a nice drop after 8pm and into tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 07:14:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ holy shit so many puts bought today… </td>
   <td style="text-align:left;"> 2021-12-14 07:13:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> VIDEO: Broad Market Technical Analysis Chart 12/13/2021 $SPY $XLF $QQQ $TSLA $AAPL https://www.chartguys.com/daily-market-videos/4045/bears-out-in-full-force </td>
   <td style="text-align:left;"> 2021-12-14 07:13:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $SPX $QQQ $DIA $IWM  
 
What a truly epic (and accurate) sign off after 28 years on air. 
 
--- 
 
&amp;quot;But the darkness on the edge of town has spread to the main roads and highways and neighborhoods&amp;quot; 
“Grown men and women who swore an oath to our Constitution have decided to join the mob and become something they are not, while hoping we somehow forget who they were.&amp;quot; 
&amp;quot;They’ve decided to burn it all down with us inside. That should scare you to no end.&amp;quot; 
&amp;quot;The reality, though, is I will wake up tomorrow in the America of the year 2021, a nation unrecognizable to those who came before us and fought to protect it. Which is what you must do now.&amp;quot; 
 
https://www.thewrap.com/brian-williams-warns-nation-unrecognizable-in-final-msnbc-sign-off/ </td>
   <td style="text-align:left;"> 2021-12-14 07:12:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $AMC AMC bulls looking for another reason to buy after their NFT token idea was scrapped by Adam Aron: </td>
   <td style="text-align:left;"> 2021-12-14 07:12:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $BTC.X $ETH.X 

Here is how you can help the tornado victims 
I know the markets have been tough but it’s  next to nothing when compared with a lot of families that won’t have places and warm meal to celebrate this holiday season 

I did what I could. 

https://www.usatoday.com/story/news/nation/2021/12/13/kentucky-tornado-victims-donations-help/6493622001/ </td>
   <td style="text-align:left;"> 2021-12-14 07:12:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ startup barometer is a gauge of startup activity that equally considers capital raised, deal count, first financings, and exit count. </td>
   <td style="text-align:left;"> 2021-12-14 07:10:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $DJIA $NASDAQ $QQQ 

Fed Loses Control As Consumers Now Expect 10% Inflation For Key Staples https://invesbrain.com/fed-loses-control-as-consumers-now-expect-10-inflation-for-key-staples/ </td>
   <td style="text-align:left;"> 2021-12-14 07:09:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ dangerous to be a bull here.. look at 2018 December when Powell messed with rates </td>
   <td style="text-align:left;"> 2021-12-14 07:08:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> What would it take for futures to be red? Why is it impossible? $spy $qqq </td>
   <td style="text-align:left;"> 2021-12-14 07:07:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ futes ripping </td>
   <td style="text-align:left;"> 2021-12-14 07:04:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Incoming  ... Asia and EU kicking th shit out of this overpriced p o s then comes Fraud St USA  ... https://finance.yahoo.com/quote/TSLA?p=TSLA  $TSLA $SPY $QQQ $SPX $NDX </td>
   <td style="text-align:left;"> 2021-12-14 07:04:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA FUTES RIPPIN CANOES SHIPPIN OARS DIPPIN AND FLIPPIN SCOTTIE PIPPEN POTATO CHIPPIN </td>
   <td style="text-align:left;"> 2021-12-14 07:03:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $riot $pton $qqq
Control your losses. One good day can make up for a lot of bad days IF you cut losers quickly. I was 10% in the red for the month but made it all back today. Now I get to work keeping the losing days small until the next easy day comes. I only need one or two easy days for the rest of the month. </td>
   <td style="text-align:left;"> 2021-12-14 07:01:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $IWM $DJIA 

What is Powell going to announce this week?
Here is our best guess; Dovish or hawkish?
https://youtu.be/pXxh5jkqqrw </td>
   <td style="text-align:left;"> 2021-12-14 07:00:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 😁 </td>
   <td style="text-align:left;"> 2021-12-14 07:00:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY TSLA and NVDA finally broke down meaningfully below psychological $1000 and $300 level. They were carrying the QQQs. Gonna be very difficult to find new leadership that can offset the potential losses on these highfliers. </td>
   <td style="text-align:left;"> 2021-12-14 06:58:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $qqq I hear your Mom&amp;#39;s going out with Squeak. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY nobody listened last night </td>
   <td style="text-align:left;"> 2021-12-14 06:56:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA Tesla Tsla Tesla  🧞‍♂️

Make me Rich Btch $SPY $SPX $ES_F $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 06:52:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA Excellent,  welcome to crash Tuesday https://www.investing.com/indices/indices-futures $spy $qqq $SPX $NDX </td>
   <td style="text-align:left;"> 2021-12-14 06:52:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> 🚨BREAKING🚨

Today, a new record was placed for the number of puts traded in a single day

$SPY $QQQ $DIA $VIX </td>
   <td style="text-align:left;"> 2021-12-14 06:51:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $qqq the feeling you get when you need to break up with your partner </td>
   <td style="text-align:left;"> 2021-12-14 06:48:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY Watch this  open up and gap up hard 

$spx $es_f $qqq $dia  🧞‍♂️🤠 </td>
   <td style="text-align:left;"> 2021-12-14 06:45:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY Let&amp;#39;s talk the market
https://youtu.be/g9AZXrsH0wQ </td>
   <td style="text-align:left;"> 2021-12-14 06:44:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $BND is this the rotation out of large cap tech $QQQ into bonds? </td>
   <td style="text-align:left;"> 2021-12-14 06:43:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $qqq Is this what Christmas rally looks like? </td>
   <td style="text-align:left;"> 2021-12-14 06:43:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DIA J-Pow made the &amp;quot;worst inflation call in history&amp;quot; and now he&amp;#39;s gonna navigate rate hikes?? Pleezzz... </td>
   <td style="text-align:left;"> 2021-12-14 06:41:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AMZN Keep trying Bears 
🤑 $amd $qqq $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 06:39:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Commentary: Paul Ebeling on Wall Street, Special Report
#sentiment #stock #market #rally #Fed

$DIA $SPY $QQQ $RUT $VXX

“Sentiment is the fuel driving this market” — Paul Ebeling

Most retail investors do not just own the indexes, they own growth stocks, and are married to the 1s that have greatly appreciated in price over the past yr +.  

When those stocks become too crowded the market conveniently destroys those issues...

https://www.livetradingnews.com/commentary-paul-ebeling-on-wall-street-special-report-3-214298.html </td>
   <td style="text-align:left;"> 2021-12-14 06:34:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ who will hold up the market tomorrow? $APPL $MSFT $COST their days are numbered... </td>
   <td style="text-align:left;"> 2021-12-14 06:33:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY  Over the past year, workers’ hourly pay has increased by 4.8% . Oil has fallen more than 20% in past 3 weeks. Inflation is not that high and is coming to lower level. </td>
   <td style="text-align:left;"> 2021-12-14 06:32:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ Reuters: Fed to pivot on inflation fears in the face of another uncertain year.
https://www.reuters.com/markets/us/fed-pivot-inflation-fears-face-another-uncertain-year-2021-12-13/ </td>
   <td style="text-align:left;"> 2021-12-14 06:32:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Russia says it may be forced to deploy mid-range nuclear missiles in Europe $Ba $lmt $dfen $spy $qqq  https://www.reuters.com/world/russia-says-lack-nato-security-guarantees-would-lead-confrontation-ria-2021-12-13/ </td>
   <td style="text-align:left;"> 2021-12-14 06:27:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ It’s amazing the level of cluelessness surrounding what’s really going on in the market. Markets so close to all time highs and yet 99% of stocks down 30-50% if not more. This could be worse then the .com bubble considering how long it will take people to make their money back. Some stocks will never even come close to recovering ñ, and yet hedge funds make out looking great. Retail gets stuck holding the bag once again </td>
   <td style="text-align:left;"> 2021-12-14 06:26:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL today was light red but $QQQ looks like it can drop another 2% very easily.  Especially if $AAPL and $TSLA continue.  Good luck bulls and bears. </td>
   <td style="text-align:left;"> 2021-12-14 06:26:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $FNGU $WMT $UVXY   
 
If you place a trade for a specific event you don&amp;#39;t have a trade, you have a bet. A hedge is just a synonym for bet. 
 
If it doesn&amp;#39;t work (on average, mean or median) in Vegas, why would you think it would work in the markets?  
 
Tis what tis, and thousands have learned this the hard way, some with more time than others. </td>
   <td style="text-align:left;"> 2021-12-14 06:24:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ every smarty pant with an airtime thinks he or she is smarter than Feds. Think they can handle economy better than Feds. Anyone can do a commentary from their living room wearing pajama. </td>
   <td style="text-align:left;"> 2021-12-14 06:22:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Friends, followers, haters and those on block for jawboning stupid  ... check out the 6 M 700&amp;#39;s, duh, due diligence, dramatically lower thereafter, fact ... https://www.marketwatch.com/investing/stock/tsla?mod=quote_search $tsla $spy $qqq $SPX $NDX  ... tdtiahth @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈 ... carry on shorting this p o s for profits and following me ✔ </td>
   <td style="text-align:left;"> 2021-12-14 06:18:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ pump it!! </td>
   <td style="text-align:left;"> 2021-12-14 06:17:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $DOW when does Powell speaks on rates, tomorrow or Wednesday? </td>
   <td style="text-align:left;"> 2021-12-14 06:16:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AMZN I was Born in the Dark
I embrace the dark 🏊 
$qqq $amd $spy 🤑 </td>
   <td style="text-align:left;"> 2021-12-14 06:15:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA  I love Elan  Love Money 

$es_f $spx $qqq $RUT 🧞‍♂️🚀 </td>
   <td style="text-align:left;"> 2021-12-14 06:12:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 06:12:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $BTC.X $AMC $QQQ 

I  don’t even watch comedy movies anymore, I just come Stocktwits to get my laughs 😭😭😭😂😂😂 love u all! Hope everyone has a great week! </td>
   <td style="text-align:left;"> 2021-12-14 06:12:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ Tom Brady scanning a defense pre-snap </td>
   <td style="text-align:left;"> 2021-12-14 06:11:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Could a rotation to small caps happen soon? </td>
   <td style="text-align:left;"> 2021-12-14 06:08:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA I love my tesla calls 🧞‍♂️

$spy $spx $qqq $dia 🧞‍♂️🦎🎄🤶🚀 </td>
   <td style="text-align:left;"> 2021-12-14 06:08:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA INFLATION? Buy pricing power. $AAPL $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 06:07:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  anyone know why there was a sell off? </td>
   <td style="text-align:left;"> 2021-12-14 06:05:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ  cash is a position too </td>
   <td style="text-align:left;"> 2021-12-14 06:03:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $WISH Both Amazon and Alibaba reportedly tried to buy Wish, in fact, according to reports from a couple of years ago, but Wish rejected those offers. Now Amazon is trying to beat Wish at its own game, which has encouraged others, like eBay now, to follow. $IWM $EBAY $QQQ $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 06:01:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ I wonder when this friggin bliodbath ends. Very fcken boring! 🤬🤬 </td>
   <td style="text-align:left;"> 2021-12-14 06:00:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ i love this market!! its so exciting!! </td>
   <td style="text-align:left;"> 2021-12-14 05:58:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY  Trillions in debt. $QQQ $DJIA </td>
   <td style="text-align:left;"> 2021-12-14 05:57:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ + </td>
   <td style="text-align:left;"> 2021-12-14 05:56:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Say hi to my mom and her Gretel, she&amp;#39;s the kindest and coolest person I&amp;#39;ve ever met. She&amp;#39;s also the reason I got into Wall St. Her entire port consists of five stocks, $IBM which hasnt moved a cent in 20 yrs being one of them - she doesnt allow me to sell bc of dividends lmao. But she bought $FB and $TSLA in 2014 which is simply adorable. $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:55:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $EWC $QQQ
Omicron to be 50% of cases in 3 days and 95% of cases in 10 days. From head of Canada/Ontario COVID-19 Science Advisory Table. Crazy spread factor.

R = 3.4

Set your stops.

#Omicron </td>
   <td style="text-align:left;"> 2021-12-14 05:53:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:52:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> 5-Day ETF Sentiment Recap: $QQQ is the #2 ETF that institutions are trading over rolling 5 day window with 370.5K options contracts.

Market analysis included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 05:50:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY 472
$QQQ  400

Before FOMC…why? Because over night algo pump </td>
   <td style="text-align:left;"> 2021-12-14 05:50:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ head and shoulders yet there is also a inverse h&amp;amp;s too. Pick your poison I chose mine 😈 </td>
   <td style="text-align:left;"> 2021-12-14 05:48:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $AAPL CNBC: El-Erian says &amp;#39;transitory&amp;#39; was the &amp;#39;worst inflation call in the history&amp;#39; of the Fed.
https://www.cnbc.com/2021/12/13/el-erian-says-transitory-was-the-worst-inflation-call-in-the-history-of-the-fed.html </td>
   <td style="text-align:left;"> 2021-12-14 05:47:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $NVDA $SPY $BTC.X $VOO what is the old saying? 

“never be short on a Tuesday” </td>
   <td style="text-align:left;"> 2021-12-14 05:47:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ #Bidenboom yall </td>
   <td style="text-align:left;"> 2021-12-14 05:46:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY TODAYS THE FIRST DAY I COULD AFFORD STEAK FOR DINNER. THANKS FOR THE MONEY BULLS IT WAS MUCH NEEDED $AAPL $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:45:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $AAPL ) </td>
   <td style="text-align:left;"> 2021-12-14 05:43:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $DJIA $IWM  “booming” market is a complete sham held up with twigs and straw. </td>
   <td style="text-align:left;"> 2021-12-14 05:42:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $AAPL # </td>
   <td style="text-align:left;"> 2021-12-14 05:41:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ im sick of this permanent shitstorm </td>
   <td style="text-align:left;"> 2021-12-14 05:40:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ I don&amp;#39;t see a modest rate hike killing the market </td>
   <td style="text-align:left;"> 2021-12-14 05:39:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ why did it just nose dive ? News ? </td>
   <td style="text-align:left;"> 2021-12-14 05:39:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ shame , shame </td>
   <td style="text-align:left;"> 2021-12-14 05:35:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Always keep in mind that you should never follow a stranger&amp;#39;s posts blindly, including mine. Treat the posts of those you trust and follow as a sounding board against your own rigorous analysis at all times.  Oftentimes, the traders you follow will leave you hanging in the critical moments when the market reverses because they&amp;#39;re too busy managing their own money.  Your money is a distant last on the priority totem pole.  My posts are intended to illustrate one way, out of many, to approach the market and trade successfully.  The odds you will get rich following others is almost zero.  Develop the system that works for you.  Good luck everyone $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:35:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ 

https://www.youtube.com/watch?v=7srQM8VljJA

If inflation indeed has peaked then it is super bullish for stocks </td>
   <td style="text-align:left;"> 2021-12-14 05:35:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Clearly a fear trade is what the market is experiencing right now with all major indices taking a hit today and the dollar gaining some strength. Not surprised as we head into Wednesdays FOMC meeting. $SPY $QQQ $DJIA </td>
   <td style="text-align:left;"> 2021-12-14 05:34:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ bring on the recession, have job openings and can put ignorant millenials towards honest work and pay and will learn them real quick that &amp;quot;crying for what you want&amp;quot; ended at your mom 🙂🙃 </td>
   <td style="text-align:left;"> 2021-12-14 05:34:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA  .. lots of jawboning here ... glta ... back later sometime ... I&amp;#39;ve shared the truth  ... enjoy the Armageddon Depression  ... good health and trading to all $spy $qqq $SPX $NDX 🐻❤😈  ... tdtiahth @Profit_Maker https://stocktwits.com/Profit_Maker ✔ </td>
   <td style="text-align:left;"> 2021-12-14 05:34:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Majority House Leader Chuck Schumer Says Senate Will Vote Tuesday On Legislation To Raise The Federal Gov&amp;#39;t. Debt Limit 
 
Morgan Stanley CEO Says Fed Should Move &amp;#39;Earlier Rather Than Later&amp;#39; On Interest Rate Hikes 
 
$SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:33:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA $ARKK 

Is everyone done urinating and shitting on themselves over the Fed meeting? </td>
   <td style="text-align:left;"> 2021-12-14 05:33:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $SPX $ES_F $QQQ $DIA  Update 

The quicker we get to $4480 - $4500

The quicker we can get on with Christmas 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 05:33:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 
Looking to see a reaction to the 50dma </td>
   <td style="text-align:left;"> 2021-12-14 05:32:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  These things are perfectly timed..https://nypost.com/2021/12/13/pfizer-astrazeneca-vaccines-less-effective-at-fighting-omicron-study/ </td>
   <td style="text-align:left;"> 2021-12-14 05:32:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $AMZN Is anybody else curious about what they&amp;#39;ll find?

https://www.msn.com/en-us/money/companies/amazon-s-fatal-warehouse-collapse-is-being-investigated-by-osha/ar-AARM5DJ?ocid=msedgntp </td>
   <td style="text-align:left;"> 2021-12-14 05:32:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPX $SPY $QQQ $IWM not good...we closed at/near today&amp;#39;s lows...all eyes on Fed&amp;#39;s Wednesday.

Are you bullish or bearish? </td>
   <td style="text-align:left;"> 2021-12-14 05:31:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ I wanna see this thing under 389 </td>
   <td style="text-align:left;"> 2021-12-14 05:29:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ got out of my puts at the last few mins hit my targets it held 18 on the ask could see a small push tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 05:29:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY Continuing to sell off 🧞‍♂️ Sorry 

Futures report Bears 4    Bulls 0 

🧞‍♂️🤠 $SPX $ES_F $QQQ $NASDAQ </td>
   <td style="text-align:left;"> 2021-12-14 05:28:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $DIA $QQQ 

$100B pulled out from crypto
$150B pulled out from (AAPL + TSLA + NVDA)
$$200B rest of the companies combined. 

Guess these 500B is ready to get deployed into the markets anytime. 

Anything other than overnight drop of 3-4% in markets is “BUY THE DIP”

GL! </td>
   <td style="text-align:left;"> 2021-12-14 05:27:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $BTC.X $ETH.X $SPY $QQQ PPI is already at 8.6%. Consensus for tomorrow morning&amp;#39;s report is 9.2%. Obviously this is all going to get passed on to the consumer. Hedge inflation </td>
   <td style="text-align:left;"> 2021-12-14 05:27:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $qqq who flipped bear at close.. raise your hands... </td>
   <td style="text-align:left;"> 2021-12-14 05:26:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ just broke then neckline of that head and shoulders on the 1 min chart.

I got puts and calls as a straddle here’
Would love to see my puts print 10X </td>
   <td style="text-align:left;"> 2021-12-14 05:22:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ .. </td>
   <td style="text-align:left;"> 2021-12-14 05:22:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ On Wednesday, I think the FED will announce doubling the pace of tapering and expect to hike rates twice next year. As long as they don&amp;#39;t announce anything more hawkish that that, the market should rally </td>
   <td style="text-align:left;"> 2021-12-14 05:21:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM $BTC.X $ETH.X Santa rally my ass!!!  F U bulls!!! </td>
   <td style="text-align:left;"> 2021-12-14 05:21:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $PYPL $FB $QQQ $AAPL $MSFT https://youtu.be/xV6vAqwCzX0 </td>
   <td style="text-align:left;"> 2021-12-14 05:20:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ how are my cultists doing here? Still holding out for what exactly? 450? 500? Lemme guess 1,000 PT!!!!  Ohh you all don’t know what pain is but you GON learn. YOU GON learn real soon </td>
   <td style="text-align:left;"> 2021-12-14 05:19:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Tomorrow 386 after that up from there. </td>
   <td style="text-align:left;"> 2021-12-14 05:16:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ gap down for a nice island top!! </td>
   <td style="text-align:left;"> 2021-12-14 05:16:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ incredible day and month. 26 swings this month, 24 successful, 2 still open. Not selling anything just trying to tell you that there are very simple trading strategies that do work (not 100% but 80%+), see previous posts and do your own backtests, it&amp;#39;s always the same = EMA cross or confi, 2 consecutive green/red candles, 2nd closing higher/lower than 1st, 66% sellers/buyers, being satisfied with 20%+, that&amp;#39;s it GL. </td>
   <td style="text-align:left;"> 2021-12-14 05:16:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $UVXY $SPY $QQQ $IWM I don’t know about “unlimited” or “transitory”, but if anything, the #Fed is not “transparent” .. tomorrow interest rate hike will show it </td>
   <td style="text-align:left;"> 2021-12-14 05:15:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> In the last month $QQQ has a been trading in the 378.90 - 408.71 range, which is quite wide. https://www.chartmill.com/stock/analyzer/stock/QQQ?key=d8dac8fb-a874-4422-96db-185a5752c108&amp;amp;utm_source=stocktwits&amp;amp;utm_medium=TA&amp;amp;utm_content=QQQ&amp;amp;utm_campaign=social_tracking </td>
   <td style="text-align:left;"> 2021-12-14 05:15:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $QQQ $SPY $ </td>
   <td style="text-align:left;"> 2021-12-14 05:14:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY i like how people think this is the start of a bear market when they said the same thing last week and look what happened. Whipped them so freaking bad and the same thing is going to happen all over again which is even BETTER. </td>
   <td style="text-align:left;"> 2021-12-14 05:14:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:14:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $ES_F $SPX $QQQ $DIA 

Hope you all crash this tonight -$1000 </td>
   <td style="text-align:left;"> 2021-12-14 05:14:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ US Senate to vote tomorrow to raise government debt limit. </td>
   <td style="text-align:left;"> 2021-12-14 05:13:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ Overall fundamentals remain great for this market. The pandemic is now under complete control, the US economy is very strong, corporate earnings are very strong and we no longer have a clown like Trump in the White House, etc. Any dip is a buying opportunity and we should see the santa claus rally starting after the FED on Wednesday </td>
   <td style="text-align:left;"> 2021-12-14 05:13:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $PTON Bounce to the 20 MA could be happening which is around 45.00

$AAPL $TSLA  $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 05:13:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ i don’t want to think so but it does feel like the tech bubble in 1999/2000. Please look at charts of many tech high flyers with big mountain tops! </td>
   <td style="text-align:left;"> 2021-12-14 05:13:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ I’m going to start a $50 to $1000 challenge on my YouTube channel. Not a bad start to the challenge? First day. 🤷‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 05:11:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ wouldn’t it be funny to see this at $400 and spy at 472 tomorrow 😂 </td>
   <td style="text-align:left;"> 2021-12-14 05:11:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY Perma bulls </td>
   <td style="text-align:left;"> 2021-12-14 05:10:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ bears won fair and square </td>
   <td style="text-align:left;"> 2021-12-14 05:10:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ that&amp;#39;s the beginning of bearish market..welcome to 2022...Watching on Wednesday decision </td>
   <td style="text-align:left;"> 2021-12-14 05:09:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ 

Any news came out right before the close? Strange to see the market selling off all of the sudden </td>
   <td style="text-align:left;"> 2021-12-14 05:09:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $NVDA $SPX $QQQ $AAPL $SPY 

Motherfuckers made a lot of stink when I called this. Who’s your fucking daddy now?! </td>
   <td style="text-align:left;"> 2021-12-14 05:08:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $BTC.X $BX $BRK.A 
Great things take time like Moiraine Sedai’s Power 
¯\_(ツ)_/¯ </td>
   <td style="text-align:left;"> 2021-12-14 05:08:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY psst...This doesn&amp;#39;t look at all like the face-ripping Santa Claus rally I was promised. </td>
   <td style="text-align:left;"> 2021-12-14 05:08:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ bearishness of this market is uncanny. </td>
   <td style="text-align:left;"> 2021-12-14 05:07:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ have a feeling they will hold off on the rates as this “new” variant may cause damage to economy. This will indefinitely put us in major trouble down the road. </td>
   <td style="text-align:left;"> 2021-12-14 05:07:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY hey hey Folks Fk you calls 

Calls on fire in dumpster $SPX $NDX $NASDAQ  🧞‍♂️🤠          $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:06:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $IWM I‘ve been a bull all year on small caps but I don’t know how one can continue to be here. So many risk factors and positioning is going to lead to a significant long bleed down.  Any sort of risk has already gotten hammered but no bullish catalysts I site, so downward pressure will continue.  $SPY $QQQ $BTC.X </td>
   <td style="text-align:left;"> 2021-12-14 05:06:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $GME $AMC $TSLA Pretty solid close, especially with major indices $SPY $QQQ puking down to the LOD. #CrashTheMemes is just getting started. Tomorrow $AMC under 22, $GME under 135, $TSLA under 950, for the next leg lower. </td>
   <td style="text-align:left;"> 2021-12-14 05:05:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY  $QQQ What a day!  Top alerts from the option5™ trading robot today. 32 alerts, 88% success rate! </td>
   <td style="text-align:left;"> 2021-12-14 05:05:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ thats all folks .. not a great way to end the day for indices.. just go with the flow! short it until it stops working! </td>
   <td style="text-align:left;"> 2021-12-14 05:05:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 👎 </td>
   <td style="text-align:left;"> 2021-12-14 05:05:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ why suddenly strong sell off? Wtf is wrong with the market?? I have been losing money this whole year. I suck at investing </td>
   <td style="text-align:left;"> 2021-12-14 05:05:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Major market crash inbound. </td>
   <td style="text-align:left;"> 2021-12-14 05:05:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ inverse head and shoulders </td>
   <td style="text-align:left;"> 2021-12-14 05:04:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY MOC on the SELL SLIDE SIDE

$spx $es_f $qqq $djia 🧞‍♂️⭐️⭐️⭐️⭐️🍺 cheers </td>
   <td style="text-align:left;"> 2021-12-14 05:04:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ this was over $400 in pre-market...😂.  Today sucked. </td>
   <td style="text-align:left;"> 2021-12-14 05:04:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ WOW!!! Instantly trapped formerly green dip buyers </td>
   <td style="text-align:left;"> 2021-12-14 05:04:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ The Vix and the bond market, as well as crude oil…ALLLL pointed towards this down move. Most of all…. The options data pointed towards a drop. 😎 </td>
   <td style="text-align:left;"> 2021-12-14 05:03:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $DIA $NDAQ $QQQ $IWM Ugly day across the board. PPI data tomorrow. FOMC Press Conference Wednesday. </td>
   <td style="text-align:left;"> 2021-12-14 05:02:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ all up from here;  if you didn&amp;#39;t know then now you know :) </td>
   <td style="text-align:left;"> 2021-12-14 05:02:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $SPX $QQQ $NDX $DIA 🧞‍♂️

Go ahead Sell it of hard now </td>
   <td style="text-align:left;"> 2021-12-14 05:02:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Wait all day and then crash at the close. Classy. </td>
   <td style="text-align:left;"> 2021-12-14 05:02:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ and it fuckin plummets </td>
   <td style="text-align:left;"> 2021-12-14 05:02:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ LOL 😂 </td>
   <td style="text-align:left;"> 2021-12-14 05:02:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY nasty close $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:01:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA Mercy.  Somebody rang the closing bell 😀😅😂😆🤑🤣💲💰💲💰 $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:01:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ holy shit a lot better then I imagined </td>
   <td style="text-align:left;"> 2021-12-14 05:01:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ don’t usually go heavy on puts but im feeling bearish </td>
   <td style="text-align:left;"> 2021-12-14 05:01:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ omg 😲 down huge </td>
   <td style="text-align:left;"> 2021-12-14 05:01:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ just crash it FFS. what is this shitshow for a whole year now?!? </td>
   <td style="text-align:left;"> 2021-12-14 05:01:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ that gap just waiting to be filled </td>
   <td style="text-align:left;"> 2021-12-14 05:00:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 

And it’s only Monday 🤣🤣

Calls ☎️⛔️ </td>
   <td style="text-align:left;"> 2021-12-14 05:00:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY alright then. Looks like they selling this for me to dip buy the shit out of it for Wednesday because the intelligent people know the fed won’t do anything about inflation. </td>
   <td style="text-align:left;"> 2021-12-14 04:59:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ yep 380 puts for Wednesday </td>
   <td style="text-align:left;"> 2021-12-14 04:58:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  I hope if you voted Joe, that you&amp;#39;re man/woman enough to admit you were wrong. </td>
   <td style="text-align:left;"> 2021-12-14 04:58:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:58:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA TESLA aka ... zhit on a stick worth 300 bucks ... at best ... due diligence  ... oink, oink 😉 $ARKK $SPY $QQQ $SPX  ✔ channel checked 🏁 </td>
   <td style="text-align:left;"> 2021-12-14 04:58:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $TSLA $LCID $SOFI 
LETS GO BRANDON!!!!! </td>
   <td style="text-align:left;"> 2021-12-14 04:58:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Crash the Bastard!!! </td>
   <td style="text-align:left;"> 2021-12-14 04:58:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA AW LAWD ME CANOE HIT AN ICE CUBE 🧊 🛶 YARRRRRRRR BIGLY </td>
   <td style="text-align:left;"> 2021-12-14 04:58:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ cmon </td>
   <td style="text-align:left;"> 2021-12-14 04:57:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 

You already Bought High hoodie 🤣🤣🤣

Calls 💋 </td>
   <td style="text-align:left;"> 2021-12-14 04:57:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ done for the day. the bottom fell out if you were able to handle the lunch &amp;quot;rough seas&amp;quot;.
caviar dreams &amp;amp; champagne wishes to you
[[remember!  lotsa overhead puts to trash bear dreams very soon if not in hours, puts are not safe imo, the math could change]] </td>
   <td style="text-align:left;"> 2021-12-14 04:56:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ $LCID $SOFI 
Sometimes stonks go up sometimes they go down! Either way you should be ready!! </td>
   <td style="text-align:left;"> 2021-12-14 04:56:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ not 391 wtf omg it’s gonna happen </td>
   <td style="text-align:left;"> 2021-12-14 04:55:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $DJIA $QQQ Come on let this crash already lol </td>
   <td style="text-align:left;"> 2021-12-14 04:55:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ Big selloff into the close! Let&amp;#39;s go bears! </td>
   <td style="text-align:left;"> 2021-12-14 04:54:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ make it stop 🤦‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 04:53:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ buying opportunity!!! </td>
   <td style="text-align:left;"> 2021-12-14 04:53:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ turmoil </td>
   <td style="text-align:left;"> 2021-12-14 04:53:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY you gotta love those last 10mins hehe </td>
   <td style="text-align:left;"> 2021-12-14 04:52:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ fuck it go under 93 </td>
   <td style="text-align:left;"> 2021-12-14 04:52:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA S&amp;amp;P 500 (SPY) Technical Analysis, Forecast, and Trade Ideas: 
https://www.youtube.com/watch?v=7SJElQgvSEA </td>
   <td style="text-align:left;"> 2021-12-14 04:52:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ alright kick me when I’m down </td>
   <td style="text-align:left;"> 2021-12-14 04:52:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $iwm $qqq $djia MOC 2 BILLION TO SELL </td>
   <td style="text-align:left;"> 2021-12-14 04:52:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ looked so good a half an hour ago :-) </td>
   <td style="text-align:left;"> 2021-12-14 04:52:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Texas chainsaw Massacre. Nice x </td>
   <td style="text-align:left;"> 2021-12-14 04:51:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ damn dive at the end </td>
   <td style="text-align:left;"> 2021-12-14 04:51:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Baby boy AAPL is done. QQQ won&amp;#39;t hold. </td>
   <td style="text-align:left;"> 2021-12-14 04:51:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $UVXY to easy i tell yall what the hell are you overthinking it for? Lol $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:51:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ as long as $393 holds 😳 </td>
   <td style="text-align:left;"> 2021-12-14 04:51:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $NQ_F holy $shit that was epic bear raid  in /nq just now.  banked it ; )  DID YOU SEE bid/ask </td>
   <td style="text-align:left;"> 2021-12-14 04:51:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ Plunge this pos to the lows already... </td>
   <td style="text-align:left;"> 2021-12-14 04:50:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Dead money long re  https://www.google.com/url?sa=t&amp;amp;rct=j&amp;amp;q=&amp;amp;esrc=s&amp;amp;source=newssearch&amp;amp;cd=&amp;amp;ved=2ahUKEwjkzoCV0uH0AhVUK80KHW9tBjcQxfQBKAB6BAgCEAI&amp;amp;url=https%3A%2F%2Fwww.fxstreet.com%2Fnews%2Ftesla-tsla-stock-price-and-forecast-will-tesla-break-1-000-202112131327&amp;amp;usg=AOvVaw0XJH58ZLBtalymjFV36Eb5 $tsla ... enjoy the TESLA FLASH CRASH  ... $ARKK $SPY $QQQ $SPX  Thank dog that I am here to help @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈 </td>
   <td style="text-align:left;"> 2021-12-14 04:47:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $DIA $IWM 

Sell signal! If $AAPL falls hard, market will tank.

I hope Powell may calm down the market, we&amp;#39;re not ready for faster pace of tapering. </td>
   <td style="text-align:left;"> 2021-12-14 04:44:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $DJIA $NASDAQ $QQQ November&amp;#39;s Imflation reading Is 10.1% according to Ackman. And the trend is unlikely to slowdown due to an imbalance in the housing market.

Billionaire investor Bill Ackman says inflation is being underreported by the government due to soaring rent costs
https://markets.businessinsider.com/news/bonds/bill-ackman-says-inflation-is-underreported-soaring-rent-prices-cpi-2021-12 </td>
   <td style="text-align:left;"> 2021-12-14 04:44:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ (had to delete/edit as i forgot to mention TSLA) -- most people don&amp;#39;t look that closely -- in reality today FB is worth only about 6 basis points of performance to the QQQ.  the real problem is that NVDA is costing about 28 basis points and TSLA 26 basis points and AAPL about 14 basis points.  everything else is kind of a rounding error. </td>
   <td style="text-align:left;"> 2021-12-14 04:43:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $NVDA $QQQ $SPY Where are all the crystal balls? </td>
   <td style="text-align:left;"> 2021-12-14 04:43:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ WELL taking some losses bought calls last week for today that didn&amp;#39;t work lmaoo </td>
   <td style="text-align:left;"> 2021-12-14 04:42:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ wfff if they not letting this drip like I hoped. $397 calls for wed! Let’s go for now </td>
   <td style="text-align:left;"> 2021-12-14 04:42:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $spy $qqq $googl https://www.youtube.com/watch?v=xD9Nu_487sQ </td>
   <td style="text-align:left;"> 2021-12-14 04:41:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Interesting day... $SPX $SPY $QQQ $DIA $VIX </td>
   <td style="text-align:left;"> 2021-12-14 04:40:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $AAPL START THE PRINTERS!! </td>
   <td style="text-align:left;"> 2021-12-14 04:40:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $AAPL RALLY INTO CLOSE?!! </td>
   <td style="text-align:left;"> 2021-12-14 04:40:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $msft $aapl $qqq https://www.youtube.com/watch?v=1jnfZaEyseE&amp;amp;ab_channel=UnlimitedOptionsInvesting </td>
   <td style="text-align:left;"> 2021-12-14 04:40:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $LCID wow...added to the $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:38:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $ROKU lonnngggggg $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 04:36:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ man.. a nice 2% gap down would confirm the head and shoulder an create a massive island reversal. almost gets you hard in the pants thinking about the carnage </td>
   <td style="text-align:left;"> 2021-12-14 04:34:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $PTON Congrats Bulls!
 PTON close &amp;gt;41.00 
Maybe some massive short covering underway 
PTON 46.00 47.00 - 60.00 then dropped 😂

$AAPL $AMD $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 04:34:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ So market moves next payday for the working class and those 401k deposits reach investment firms, ideas? thanks $GME </td>
   <td style="text-align:left;"> 2021-12-14 04:32:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ will this gap down 
I have puts and calls for Wednesday </td>
   <td style="text-align:left;"> 2021-12-14 04:32:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ trying to pin on a Monday huh. 🤓 </td>
   <td style="text-align:left;"> 2021-12-14 04:32:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY $UPST $ROKU ridin Kawasaki, I could cop your mother a new rari, double C bought Chanel cause she bad bad bad </td>
   <td style="text-align:left;"> 2021-12-14 04:30:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $DJIA Adding puts soon </td>
   <td style="text-align:left;"> 2021-12-14 04:30:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $IWM  
Nice gaps 
 $QQQ $DIA </td>
   <td style="text-align:left;"> 2021-12-14 04:30:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 3 long green candles off oversold </td>
   <td style="text-align:left;"> 2021-12-14 04:29:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA sux2bme +35,000 🇨🇦 since close Friday shorting this bullshit for profits.  Rest assured we ain&amp;#39;t seen nothing. Fact.  Carry on following me for profits. Thank dog that I am here to help @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈 Enjoy the Armageddon Depression ✔ $arkk $spy $qqq $SPX </td>
   <td style="text-align:left;"> 2021-12-14 04:29:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SQQQ $QQQ apparently you can make a lot of money on these, almost a forsure thing by now either bearish/bullish respectively. If JPOW says no tapering, I&amp;#39;m moving anywhere that doesn&amp;#39;t use $USD 😤 😒 😑  my $500k house will buy me a plane ticket and maybe a Starbucks if my vaccine don&amp;#39;t kill me first. </td>
   <td style="text-align:left;"> 2021-12-14 04:28:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ according to Zillow you young people priced out forever! </td>
   <td style="text-align:left;"> 2021-12-14 04:28:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ i guess facebook is holding up the entire market right now...? lmao </td>
   <td style="text-align:left;"> 2021-12-14 04:26:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ if you strike me down I will become more powerful than you can possibly imagine </td>
   <td style="text-align:left;"> 2021-12-14 04:26:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ who has a crystal ball?  if they do, do we see a run up into the close? </td>
   <td style="text-align:left;"> 2021-12-14 04:26:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 407 EOW btw </td>
   <td style="text-align:left;"> 2021-12-14 04:25:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ AAPL is going down </td>
   <td style="text-align:left;"> 2021-12-14 04:23:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ this is the money candle!🍾🍾 </td>
   <td style="text-align:left;"> 2021-12-14 04:23:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ just remember it&amp;#39;s a BULL MARKET you freaks </td>
   <td style="text-align:left;"> 2021-12-14 04:23:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> Getting puts on $BITO This could get worse $BTC.X $COIN $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:22:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ why don&amp;#39;t you buy some puts idiots </td>
   <td style="text-align:left;"> 2021-12-14 04:22:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $ARKK this pie is so wrong  -$SPY $QQQ

Gene Therapy 6.0%
Big Data &amp;amp; Machine Learning 5.6%
Internet of Things 5.4%
Blockchain &amp;amp; P2P 4.9%
Mobile 4.8%
Instrumentation 4.6%
Bioinformatics 4.5%
Molecular Diagnostics 4.4%
Robotics 4.0%
Next Generation Oncology 3.5% </td>
   <td style="text-align:left;"> 2021-12-14 04:21:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ $IWM Get with the program! 
Super charged rally about to commence for the rest of the year!! </td>
   <td style="text-align:left;"> 2021-12-14 04:21:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 500 incoming </td>
   <td style="text-align:left;"> 2021-12-14 04:21:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $qqq $SPY  they working so hard right now. </td>
   <td style="text-align:left;"> 2021-12-14 04:20:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ STFR engaging 🤖🤖🤖🤖 </td>
   <td style="text-align:left;"> 2021-12-14 04:19:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> I agree breadth doesn&amp;#39;t look the greatest, but I tend not to focus so much on $COMPQ. For me $QQQ breadth is a much better measure... the divergence isn&amp;#39;t pretty but would only really get worried if % &amp;gt; 200MA drops below 50. </td>
   <td style="text-align:left;"> 2021-12-14 04:19:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ $SPY well that bounce didnt last long. </td>
   <td style="text-align:left;"> 2021-12-14 04:19:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 395 close
Shit load of put holders </td>
   <td style="text-align:left;"> 2021-12-14 04:18:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ bought a lot of cheap contracts if this falls. Let’s see these contract writers work for that money. </td>
   <td style="text-align:left;"> 2021-12-14 04:14:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SQQQ $QQQ take the negatives add the positives, hard to do when you got so many listed on nasdaq, but even the inverse SQQQ is adding to the nasdaq&amp;#39;s sentimental value. artificial as fuck. inflation till your kids pay $100 for a mcwrap - The American Dream 😆 🤣 </td>
   <td style="text-align:left;"> 2021-12-14 04:13:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ The market is not the same as it once was - retail traders are becoming more and more influential over the market.  Most of these older people truly believe are way of living is going back to how it was pre-COVID.  That is an insane assumption to make - the way our country works will not go back in time rather it will take even more leaps forward </td>
   <td style="text-align:left;"> 2021-12-14 04:13:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ 

ONLY HOODIES 🤣🤣🤣BUYING RIPS 

CALLS 💩 </td>
   <td style="text-align:left;"> 2021-12-14 04:11:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $AMZN wrote some $3420/$3410 put credit spreads for $5.00 each. Free money or will I get face fucked? $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:10:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> ETF Sentiment: $QQQ is the #4 ETF that institutions are trading with 28.6K options contracts.

Market analysis included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 04:10:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $TSLA I want to hear Gary&amp;#39;s explanation as to how come a stock with such strong fundamentals, for which one can compile a daily list of catalysts, with only 2.0x beta, could be down 4.4% on a day where $QQQ is down a mere 0.9%. Unacceptable! </td>
   <td style="text-align:left;"> 2021-12-14 04:08:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $QQQ  the drop </td>
   <td style="text-align:left;"> 2021-12-14 04:07:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $SPY $QQQ so 
fucking easy these indexes haven’t closed at the LOD in a year and a half </td>
   <td style="text-align:left;"> 2021-12-14 04:06:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> QQQ </td>
   <td style="text-align:left;"> $MRNA $bntx We rip  into $300 soon enough. POWER HOUR $SPY $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 04:04:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Dark Pool &amp;amp; Short Interest Data: 
https://www.youtube.com/watch?v=T9eXSwSV71I </td>
   <td style="text-align:left;"> 2021-12-14 09:02:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Simulated 180.0 dollar CALLS for Tuesday&amp;#39;s open on StockOrbit.
 https://apps.apple.com/us/app/stockorbit/id1541560646 </td>
   <td style="text-align:left;"> 2021-12-14 09:01:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL China made. Profits over people. Sue cook
 https://www.tradingview.com/chart/AAPL/rvCgDRdv-Apple-Ponzied-Made-in-China-Ponzi-Pogs-Stonks/ </td>
   <td style="text-align:left;"> 2021-12-14 09:00:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL &amp;quot;Apple&amp;#39;s growth prospects remain misunderstood by certain investors because they fail to accept one crucial fact: Apple is here to stay.&amp;quot; 
 
https://seekingalpha.com/article/4474908-apple-stock-savvy-investment-iconic-products </td>
   <td style="text-align:left;"> 2021-12-14 08:59:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $TSLA $UPST In trying times you can either be POSITIVE or NEGATIVE.  I choose positive every time.  Negativity may thrive short term but OPTIMISM THRIVES.  BUY &amp;amp; HODL during these times.  Watch the bears eventually flush out.  Most of these &amp;quot;bears&amp;quot; don&amp;#39;t even have any skin in the game.  You can tell how uninformed and dumb they are by their posts and comments. </td>
   <td style="text-align:left;"> 2021-12-14 08:59:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SKLZ buy stocks that your wife likes. Best advice ever! 🤣 $TSLA $AAPL $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 08:58:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL       🍏  Early Green-shoots. </td>
   <td style="text-align:left;"> 2021-12-14 08:57:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Analyst Gene Munster on Apple&amp;#39;s bright future: https://loupfunds.com/apples-3t-milestone-is-a-nod-that-its-best-days-are-to-come/ </td>
   <td style="text-align:left;"> 2021-12-14 08:57:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:56:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL haven&amp;#39;t seen a swing like this from green to red from apple before </td>
   <td style="text-align:left;"> 2021-12-14 08:55:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL NEW ARTICLE : Poland Anticompetition Watchdog Investigates Apple&amp;#39;s Privacy Settings Changes https://www.stck.pro/news/AAPL/19664580 </td>
   <td style="text-align:left;"> 2021-12-14 08:55:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

Flipping again. Gap up tomorrow. </td>
   <td style="text-align:left;"> 2021-12-14 08:51:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 170p might actually print.. </td>
   <td style="text-align:left;"> 2021-12-14 08:51:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Market was down today, but at least $AAPL hit a new high of $182.13! </td>
   <td style="text-align:left;"> 2021-12-14 08:50:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL next stop, 167 ……. </td>
   <td style="text-align:left;"> 2021-12-14 08:49:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I&amp;#39;m sure most contemporaneous bears would agree: this is a powerhouse ticker, explosively valuable, exponentially primed, etc.

But greed bends both ways today, in a drastic overemphasized manner. The upward moves are magnified, as are the tumbles.

The inflationary aspect, however, has time crunched the downside. It&amp;#39;s a snap.

Just be quick. And don&amp;#39;t pom-pom.

(Message to myself, eh?) </td>
   <td style="text-align:left;"> 2021-12-14 08:49:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL gap down tomorrow anyone?  I might actually buy a call tomorrow or not sell more shares. </td>
   <td style="text-align:left;"> 2021-12-14 08:49:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AABB $SPY $TSLA $AAPL $BTC.X The&amp;gt; GOLDEN CROSS Coming &amp;amp; fianchill PT 1.79$ BOOM Coming https://aabbgoldtoken.com/uncategorized/asia-broadband-sets-december-launch-date-for-proprietary-cryptocurrency-exchange/2021/12/08/ </td>
   <td style="text-align:left;"> 2021-12-14 08:46:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $IWM $QQQ $SPY $AMZN powell is watching ya bears be careful </td>
   <td style="text-align:left;"> 2021-12-14 08:45:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $TSLA $UPST 

The fear of omicron has been put in us as well as the fear of not being vaccinated.  Here&amp;#39;s the interesting thing - most omicron cases in the US have been hit by those who are fully vaccinated.  Isn&amp;#39;t that something.  We need more vaccines now Im guessing.

https://www.reuters.com/world/us/most-reported-us-omicron-cases-have-hit-fully-vaccinated-cdc-2021-12-10/ </td>
   <td style="text-align:left;"> 2021-12-14 08:42:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL lets talk bulls..🤞🧸

PT 165.

$UVXY $TGLS $ISWH $MARA </td>
   <td style="text-align:left;"> 2021-12-14 08:42:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $ARKK Looks to me that Cathie put a kibosh on $TWTR last week when she went bonkers with Twitter.  She has a magic touch and whatever she touches or says sth positive, hedgies pounce on it.  At least, it looks that way.

I want Cathie to go crazy on the FAANGs ($AAPL, $FB, $GOOGL) and that will make a level playing field for all the techs. Right now, FAANGs are in a stratosphere and hopefully they come back to earth and join their brothers and sisters who have been pulverized, to put it mildly. lol </td>
   <td style="text-align:left;"> 2021-12-14 08:41:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL let me guess. To da moon tmrw? 🤦‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 08:41:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL my 170 puts for this Friday </td>
   <td style="text-align:left;"> 2021-12-14 08:40:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> SweepCast alerted: $AAPL with Unusual Options Activity Alerted on $175 CALL Expiring: 12-17-2021 worth 38K🐂 |🥇 Learn How Unusual Options Helps Gain Insights! www.sweepcast.com  🥇 | </td>
   <td style="text-align:left;"> 2021-12-14 08:40:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 
This is a scam stock market 
Most investors losing ton of this year 
Investors are frustrated with manipulation 
Bio and small cap are down 80% </td>
   <td style="text-align:left;"> 2021-12-14 08:39:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL waiting for re entry … long bias though don’t hate </td>
   <td style="text-align:left;"> 2021-12-14 08:37:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:37:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL who’s the kind gentleman who was very humbly bragging about making $.5 million last night when the futures were up .34%?

Future lesson, 

Pride is concerned with who is right

Humility is concerned with what is right

Wear your wealth humbly my friend, at least what’s left of it </td>
   <td style="text-align:left;"> 2021-12-14 08:35:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $IWM BEARS </td>
   <td style="text-align:left;"> 2021-12-14 08:35:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Question, does anyone know what the name of the Android app is to detect Apple air tags they just released? Baby mama drama, don&amp;#39;t ask lol </td>
   <td style="text-align:left;"> 2021-12-14 08:35:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL my jan 22 170 puts printing 100% tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:34:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ $NASDAQ  bulls have to know what the economy is doing, the market is running on no major catalyst other then overinflation from powell printing money out of his ass, which mms might just be upping to trap people into a fucked up crash. Two new variants of the virus with no bio tech reports? Thats suspect! Powell raising interest rates and considering how much borrowed money is in the stock market and crypto, people tend to withdraw that borrowed money as the fed raises interest rates. This market is a floating donkey ready to bust at any single catalyst that has the slight of hand to crash this to the floor. I think this is a setup to trap every investment and drop it to the fucking floor with one big press release. Just my opinion. And judging by alot of the permabulls in current market conditions they’re will be a quick mood swing from happy pump to market in shreds. Permabulls will cry themselves to sleep for months wondering how they are gonna afford rent. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:32:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Technical Analysis Video: 
https://www.youtube.com/watch?v=hFZlbjq-JvQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $TSLA $AAPL $SPY $QQQ $DIA  

https://apple.news/AVSGYxVxYQmWGVFiB5JXQZQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL all the discord channels I’m in are shorting apple… expecting apple to fill its gaps. Don’t be in calls. I’m not trolling, just trying to help. </td>
   <td style="text-align:left;"> 2021-12-14 08:32:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL delusional if you think this is green tomorrow especially with the fear that the the omicron brings, with powell probably speaking on the touchy subject of interest rates wednesday this will be red all week </td>
   <td style="text-align:left;"> 2021-12-14 08:31:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 
never seen before AAPL up &amp;amp; down $4- $6 daily! </td>
   <td style="text-align:left;"> 2021-12-14 08:30:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL sell the news </td>
   <td style="text-align:left;"> 2021-12-14 08:29:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL gap down to $160 soon 📉📉📉 </td>
   <td style="text-align:left;"> 2021-12-14 08:29:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Here&amp;#39;s why $AAPL will GO DOWN tomorrow! 👉 https://youtu.be/td7Fyt6Or1U </td>
   <td style="text-align:left;"> 2021-12-14 08:29:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL huff.  Same shit. Wait 4 hours. Market will be red. Same shut. New year. </td>
   <td style="text-align:left;"> 2021-12-14 08:29:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> 5 Top Consumer Tech Stocks To Watch In December 2021 $AAPL $SGMA $LCID $BABA $QCOM  https://www.billionaireclubcollc.com/5-top-consumer-tech-stocks-to-watch-in-december-2021/ </td>
   <td style="text-align:left;"> 2021-12-14 08:28:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $QQQ $SPY $IWM jerome saw the market today </td>
   <td style="text-align:left;"> 2021-12-14 08:28:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL probably gap up tonight. I see a gap to be filled in the 160s. This is a buyers market so be carful with puts </td>
   <td style="text-align:left;"> 2021-12-14 08:23:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL … if this is down again tomorrow I’m definitely buying more shares. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL $MSFT $TSLA $AMZN Fed meeting tomorrow and Omicron is back with more deaths. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:22:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I guess I should have bought those puts </td>
   <td style="text-align:left;"> 2021-12-14 08:22:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 6 bucks from all time highs and people are freaking out. Wtf. Clueless people </td>
   <td style="text-align:left;"> 2021-12-14 08:21:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 
$4-5 down &amp;amp; $5-6 up next day ! </td>
   <td style="text-align:left;"> 2021-12-14 08:21:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL most well known richest trader Buffet has 49% of PF .. so you think you are smart shorting it 
https://twitter.com/carlquintanilla/status/1470537957807435777/photo/1 </td>
   <td style="text-align:left;"> 2021-12-14 08:21:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL how is this not $500 already this is the easiest stock to buy </td>
   <td style="text-align:left;"> 2021-12-14 08:20:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL deep red tomorrow… hide your kids. This will get ugly. </td>
   <td style="text-align:left;"> 2021-12-14 08:19:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:19:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY auuu my SWING PUTS were golden💰💸 from Friday and good thing they don&amp;#39;t exp until DEC 17, so no rush to close all them out... I love it when an OBVIOUS plan comes together🤑.. Bulls are perplexed and got hot coals 🔥raked across their backs.. 🙃🥵😂 
PUTS PRINTING 💦💦💦👱‍♀️

Told yall $AAPL was a clear target Friday and over the weekend, $TSLA couldn&amp;#39;t hold $1000 signaling massive dump to come to low $900s, $PTON saved temporarily by technicals and value flow of Covid plays $QQQ will be taken to the woodshed 🤣 OOF! 

(TAPER TAPER TAPER RATE HIKE RATE HIKE RATE HIKE⬆️⬆️⬆️ 😆🙋🎯📉) FUTURES smell like vinegar and ammonia for bulls ☢😁 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $TSLA $AAPL $QQQ $NDX . </td>
   <td style="text-align:left;"> 2021-12-14 08:18:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> 🎁Daily watchlist recap for Dec 13, 2021!!🎁
Profit potential per 100 shares is $10,781

$HOG $RIVN $AAPL $ABNB $PFE DLTR TSLA

✔Follow and turn on notifications for more amazing trade ideas!!

#unitedtraders #teamwork #finance </td>
   <td style="text-align:left;"> 2021-12-14 08:13:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> 🎁Daily watchlist recap for Dec 13, 2021!!🎁
Profit potential per 100 shares is $10,781

$HOG $RIVN latex53a899066e03afa25acd4da44ab99d39TSLA 1.07m (47% call/53% put)
$AMC 794k (51% call/49% put) </td>
   <td style="text-align:left;"> 2021-12-14 08:12:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $MSFT latex0a3a20507e6cc9cfe7bd5d42e3addc12AMC - 86% put flow
$AMD - 70% call flow </td>
   <td style="text-align:left;"> 2021-12-14 08:12:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 🖕🖕🖕🖕🖕🖕 </td>
   <td style="text-align:left;"> 2021-12-14 08:11:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  🍏 If Futures are Green at 4:00am/EDT…then it’s Bear Scramble for Breakfast! </td>
   <td style="text-align:left;"> 2021-12-14 08:10:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL https://youtu.be/4fR9KWtEAQE </td>
   <td style="text-align:left;"> 2021-12-14 08:09:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL load up!! </td>
   <td style="text-align:left;"> 2021-12-14 08:09:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $QQQ $SPY $AAPL CNBC: Morgan Stanley CEO Gorman calls for the Fed to raise interest rates soon.
https://www.cnbc.com/2021/12/13/morgan-stanley-ceo-gorman-calls-for-the-fed-to-raise-interest-rates-soon.html </td>
   <td style="text-align:left;"> 2021-12-14 08:08:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> From a business business trip to Alaska, I learned that people here really have a great sense of humor. 
The only correct way to use bathroom here is to be a human, not peek into other peoples&amp;#39; stalls, and to not be a moose. It&amp;#39;s that simple!  
  
$AAPL $TSLA $SPY $AMD $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 08:08:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Tomorrow $180 calls will print for sure $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 08:07:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Bullish on Moon Rockets? 12/17 $180 Calls for Apple? </td>
   <td style="text-align:left;"> 2021-12-14 08:06:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL       🍏 ❗️ Alert:  Early Evening Futures, ticked Green…AAPL AfterHours Volume, surged. </td>
   <td style="text-align:left;"> 2021-12-14 08:04:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Trade Analysis Video: 
https://www.youtube.com/watch?v=zceB1pcqg4M </td>
   <td style="text-align:left;"> 2021-12-14 08:02:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL guess Cramer pumping this lmao. Said fed can’t break the market lmao 🤣 powell hit us with that fuck the puts line again </td>
   <td style="text-align:left;"> 2021-12-14 08:01:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  🍏❗️Alert:  Surge in AfterHours Volume, 7.7 Million. </td>
   <td style="text-align:left;"> 2021-12-14 08:01:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 
Made great profit on calls now time to ride some puts 🤷🏽‍♂️ it’s obvious. Buy Calls again maybe around $165 and ride it to the moon again. </td>
   <td style="text-align:left;"> 2021-12-14 07:56:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $TSLA anybody here work in Algo trading? If so… Are you willing to drop a hint on when the algos will stop selling lol </td>
   <td style="text-align:left;"> 2021-12-14 07:56:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Simulated 180.0 dollar CALLS for Tuesday&amp;#39;s open on StockOrbit.
 https://apps.apple.com/us/app/stockorbit/id1541560646 </td>
   <td style="text-align:left;"> 2021-12-14 07:53:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY How long is UK lockdown? $AAPL $NVDA </td>
   <td style="text-align:left;"> 2021-12-14 07:53:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY Retail Sell All, buy back lower 15% $AAPL $TSLA $AMD </td>
   <td style="text-align:left;"> 2021-12-14 07:52:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 4 PM 9 Million shares Sell order proceed. Let’s see a spike down tomorrow morning.  Expect to see sub $170 soon.  Valuation should be around $150. </td>
   <td style="text-align:left;"> 2021-12-14 07:52:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

IM NOT A PERMA-BULL OR PERMA-BEAR , JUST A PERMA-PROFITABLE TRADER. 
DONT TRADE YOUR FEELINGS. </td>
   <td style="text-align:left;"> 2021-12-14 07:51:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Sweep Options Activity: $AAPL is the #1 ticker with sweep activity where institutions are trading options urgently with 273.0K sweep contracts, a leading indicator of market movement.

Market analysis and options contracts included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 07:50:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Apple Valuation solves world hunger… welcome to Jokeville </td>
   <td style="text-align:left;"> 2021-12-14 07:47:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

Since it’s a lot of noise, I will stick to fundamentals and will poses no change - hold for foreseeable future. 

I think it’s marketwide impact, not Apple. I don’t see any much fault in Apple. It’s just market that need some correction. I am glad that Apple take smaller loss 2% instead of wipe out of Friday gains. That means Apple is doing well.

It’s just technical correction which is normal and expected. I can see a lot other stocks performed worse than Apple. I accept that kind of rationality.

So I will maintain dipping position when necessary.

Yes I was wrong on the final hours. I learned something that didn’t expect to happen.

Lesson learned … alright Bear gained money. That’s ok! 

We have lots of time to accumulate … before new year end. 

Let’s go BULLS. </td>
   <td style="text-align:left;"> 2021-12-14 07:47:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

Tomorrow will be a Green Day. </td>
   <td style="text-align:left;"> 2021-12-14 07:45:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL did anyone else just see that </td>
   <td style="text-align:left;"> 2021-12-14 07:44:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL SpoOokY NightVision
Delta Px Eigenvector 
Linear Transformation Span OutLook

Short Wavelength 
(3,0,0) Orbital Plot
Calibration Scaler UpDate

Current Likely Vibration Range:
(183.73 / 174.18)

Last Finite Potential Well 
Measurement: 175.74
12/14/21 at 4:00AM EST Pre-Market

Developing Ad Interim Opportunity 
Potentials:
Short-Term = BUY
Long Term = SELL

sWAV SpoOokY: 
DOES NOT!!!
FORECAST STOCK PRICE, 
OFFER BUY/SELL ADVICE, or 
RECOMMEND ANY STOCK for 
TRADE or INVESTMENT.   
SpoOokY is for:
EDUCATION and ENTERTAINMENT ONLY </td>
   <td style="text-align:left;"> 2021-12-14 07:44:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Apple $AAPL $BRK.B </td>
   <td style="text-align:left;"> 2021-12-14 07:43:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Buffet hasn’t lost his grip if anything he’s gotten better in his older years $BRK.B $BRK.A $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 07:43:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I bought a 200c for 2023 too early </td>
   <td style="text-align:left;"> 2021-12-14 07:42:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 07:41:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 16 billion shares lmao announce the split </td>
   <td style="text-align:left;"> 2021-12-14 07:41:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  DARK CLOUD COVER IN AAPL 

https://youtu.be/9fJyoez8j7c </td>
   <td style="text-align:left;"> 2021-12-14 07:41:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $aapl  told u it was disgusting pump just like they did same with $nvda above $330s !! 
 
Always talk and alert before the fact either dip buys or top dump  💪 </td>
   <td style="text-align:left;"> 2021-12-14 07:41:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY BEARS HAVE ENDURED WEEKS OF TORMENT AT THE HANDS OF BULLS. CONGRATS TO MY FELLOW BEAR CUBS THAT MADE SOME FRESH GREEN $$$ TODAY. TAKING THE BULLS CASH FEELS VERY REWARDING $AAPL $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:40:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL where my bulls at ??? Holding 180 calls EOY exp. Big money in with me !!! Who else ??? Bears 🐻 on the lose today 🆙👍🏻☝🏻😱👑 </td>
   <td style="text-align:left;"> 2021-12-14 07:34:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Apple&amp;#39;s stock price brought it closer to $3 trillion target — Quartz $AAPL 💎 https://qz.com/2101950/apples-stock-price-brought-it-closer-to-3-trillion-target/ </td>
   <td style="text-align:left;"> 2021-12-14 07:34:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL $QQQ Smack .. the San Francisco treat. The city’s data reveals there were a total of 713 overdose deaths, compared to 261 COVID-19 deaths in 2020.

“Bad is an understatement. I would say it’s horrific, it is negligent, it is an epidemic in and of itself, and it was not always this way,” Jenny Shao, a freelance multimedia video journalist and San Francisco native, told NTD Television.

“Before, you were able to walk through the streets … and you did not have to try and tiptoe over bodies not knowing whether they were dead or alive.” Shao said.

Shao continued, “And, also, you did not have to hopscotch through anything like drug paraphernalia … and you were not literally walking through a scene, of say, ‘The Night of the Living Dead,’” Shao said.

One drug addict’s mother has described it as a “Zombie Apocalypse.” Her 32-year-old son is addicted to fentanyl, which has left him homeless and physically “bent over” so that he “walks like an old man.”
….

USA a 3rd World Country?? </td>
   <td style="text-align:left;"> 2021-12-14 07:33:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL hedge fund short sellers under DOJ investigation https://youtu.be/Ys4LBZ7OGLI </td>
   <td style="text-align:left;"> 2021-12-14 07:33:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Unusual Options Activity: $AAPL is the #25 ticker with unusual activity from institutional traders with an average of 12% out of the money, a leading indicator of market movement.

Market analysis and options contracts included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 07:32:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL peep that 160/155 open interest </td>
   <td style="text-align:left;"> 2021-12-14 07:29:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 175.03 /  171.01 / 165.23 supports. Parabolic movement didn&amp;#39;t create a solid supports. </td>
   <td style="text-align:left;"> 2021-12-14 07:29:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL possible 165 and spy 450.....then we bounce bulls buy leaps. Don&amp;#39;t lose money in weeklies. </td>
   <td style="text-align:left;"> 2021-12-14 07:28:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Stocks Drop On December 13 As The Mega-Cap Rally May Be Toast https://mottcapitalmanagement.com/stocks-drop-on-december-13-as-the-mega-cap-rally-may-be-toast/ $aapl $spy $amzn $nvda </td>
   <td style="text-align:left;"> 2021-12-14 07:28:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL When Mr. Market is confused &amp;amp; is selling off, consider it as discount &amp;amp; not panic. Use this time to buy Xceptional business. When common sense comes back, you will be rewarded. Long-term bullish on Apple - https://youtu.be/btBGZB5Fak0 </td>
   <td style="text-align:left;"> 2021-12-14 07:28:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL As usual the bears waken up again in their caves not reading it’s already winter and snow ❄️ is coming. Soon back in their caves. </td>
   <td style="text-align:left;"> 2021-12-14 07:28:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL a little drop does not mean it isnt bullish..😉..let see who will bite the bait. </td>
   <td style="text-align:left;"> 2021-12-14 07:27:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Short term bearish </td>
   <td style="text-align:left;"> 2021-12-14 07:26:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL wow, that’s one big ass impressive RED boner candle on the daily…if you bought calls at EOD, I’ll assume you never made it out of preschool </td>
   <td style="text-align:left;"> 2021-12-14 07:25:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY gap fill imminent.  Also 449 in play. Could get ugly. $DIA $AAPL $QQQ $BTC.X </td>
   <td style="text-align:left;"> 2021-12-14 07:25:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL imagine not closing puts. When the whole market was red. Lol healthy pullback. Going run heard er is in 40+ days lol 😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:25:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL NEW ARTICLE : 5 Top Consumer Tech Stocks To Watch In December 2021 https://www.stck.pro/news/AAPL/19661138 </td>
   <td style="text-align:left;"> 2021-12-14 07:25:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Just as an fyi.  It should be known that 3 rate hikes at a quarter to half a point each does not really effect high growth large caps much.  If we start seeing 8-11% then they are in big boy trouble. </td>
   <td style="text-align:left;"> 2021-12-14 07:25:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL   🍏MadMoney:  Jim Cramer flipping his early morning Bearish Call on “piling into the narrow Mkt MegaCap Leaders, with Fed &amp;amp; Omicron looming.  Tonight, he says…”they are the Leaders because they are the Money Makers…and Money Managers must own them in their Portfolios, &amp;amp; the Index’s must “Buy” them by virtue of their Size”.  He now is calling them the “Studs” of the Mkt.  He specifically taps AAPL… and says own/hold them through the Fed Meeting…and reassess, if FOMC is more hawkish than is expected.  He says, they are “must owns”, in any kind of Mkt.  Caveat emptor, trading off anything Jim Cramer says. </td>
   <td style="text-align:left;"> 2021-12-14 07:25:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL imagine powell hits bears with the fuck your puts Wednesday haha 😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:24:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL my jan 22 170 ps printing </td>
   <td style="text-align:left;"> 2021-12-14 07:23:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Tuesday is normally a RED day. You know what todo boyz!! </td>
   <td style="text-align:left;"> 2021-12-14 07:23:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 170-172$ tomorrow uber bearish </td>
   <td style="text-align:left;"> 2021-12-14 07:22:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> If QE ends and rates go up I want to own $WFC and $WMT. Banks only asset class to outperform in a rate increases market and Wal mart hedges the event we go into a recession. I wouldn’t want to own $TSLA $NVDA or $AAPL as growth doesn’t do well in high rate environment. You’re better off flipping to value and protective asset classes. My 2 cents. </td>
   <td style="text-align:left;"> 2021-12-14 07:21:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL It looks like the down move today started because some think that 3T makes Apple too big. I remember same thing when it hit 1T and 2T. It’s funny how people think especially that this 3T number has nothing to do with profits and what Apple does. 
But yes it was due for some retracement as I posted in the last few days due to strong up move and tax selling. Use this Sale price to buy more. </td>
   <td style="text-align:left;"> 2021-12-14 07:21:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL not really wanting to drop much more on aht 🤔. I think it bounces back 💎💎👏👏 </td>
   <td style="text-align:left;"> 2021-12-14 07:20:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Max pain is 150 this weeks. Bulls can&amp;#39;t analyze information. Nothing has been bullish for this runup. </td>
   <td style="text-align:left;"> 2021-12-14 07:18:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL is probably the only reason market hasn&amp;#39;t crashed. They literally slapped a 200 PT on this pig to keep indexes treading water. how long that going to hold up?

Am i wrong? </td>
   <td style="text-align:left;"> 2021-12-14 07:18:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 7$ drop from the highs, I really don’t like that.. that trapped a lot of buyers above 180.. </td>
   <td style="text-align:left;"> 2021-12-14 07:16:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL here’s more or less was expected on Wednesday for Fed meeting. Anything different than that and we are in trouble, acceleration rate hikes or short timeline. 🔥 </td>
   <td style="text-align:left;"> 2021-12-14 07:15:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL will bounce tomorrow. Not done yet. </td>
   <td style="text-align:left;"> 2021-12-14 07:13:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> VIDEO: Broad Market Technical Analysis Chart 12/13/2021 $SPY $XLF $QQQ $TSLA $AAPL https://www.chartguys.com/daily-market-videos/4045/bears-out-in-full-force </td>
   <td style="text-align:left;"> 2021-12-14 07:13:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL buy the fear for flip. Open green 😁 </td>
   <td style="text-align:left;"> 2021-12-14 07:11:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Daily Forecast Video: 
https://www.youtube.com/watch?v=drXGcRPPQiI </td>
   <td style="text-align:left;"> 2021-12-14 07:11:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL No matter indicates future green or not, tomorrow morning will be deep red anyway. Fed may start rate hike.  We will see market crash sooner or later. Get ready puts print! target $150 EOY. </td>
   <td style="text-align:left;"> 2021-12-14 07:10:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Nice healthy pullback. I hope this stays here and consolidates for sometime before the next leg up to 200. </td>
   <td style="text-align:left;"> 2021-12-14 07:10:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL so dumb, stupid retail fuks sell scared at 175.10 then it immediately jumps to 175.50 after 6. Dumbasses give shares away </td>
   <td style="text-align:left;"> 2021-12-14 07:09:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL not looking the greatest in AH right now </td>
   <td style="text-align:left;"> 2021-12-14 07:09:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> The industry average ROA is 5.65%. $AAPL outperforms 96% of its industry peers. https://www.chartmill.com/stock/quote/AAPL/fundamental-analysis?key=bb853040-a4ac-41c6-b549-d218d2f21b32&amp;amp;utm_source=stocktwits&amp;amp;utm_medium=FA&amp;amp;utm_content=AAPL&amp;amp;utm_campaign=social_tracking </td>
   <td style="text-align:left;"> 2021-12-14 07:09:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL a lot of common stock bought on margin….wait for the margin call </td>
   <td style="text-align:left;"> 2021-12-14 07:08:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL what was the 9 million $ put strike price that was bought on Friday? </td>
   <td style="text-align:left;"> 2021-12-14 07:04:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY market-wide stock overvaluation combined with omicron variant about to run rampant.. not to mention a plethora of other risks incl. inflation, supply chains /shortages, international contagion effects (China), the list goes on. How anyone can be bullish in this market is mind boggling to me. $MSFT $GOOG $AAPL $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:04:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> An expectation for an increase in rates have historically been good for bank stocks like $WFC and $JPM. But not for growth like $NVDA $TSLA and $AAPL. </td>
   <td style="text-align:left;"> 2021-12-14 07:04:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL just don’t be shocked 😨 tomorrow if this opens 5% or more below close price </td>
   <td style="text-align:left;"> 2021-12-14 07:01:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL a lot of open interest on 160 puts </td>
   <td style="text-align:left;"> 2021-12-14 07:00:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL either the bottom falls out and the party’s over until the $150’s or this hits $3T before eoy. It’s going to be a rough ride- but last week gave enough profit to smooth out the bumps. </td>
   <td style="text-align:left;"> 2021-12-14 07:00:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 7M usd 200 call option fomo brought apple here. Tutes made billions with $7m trap </td>
   <td style="text-align:left;"> 2021-12-14 06:59:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL people still here bragging how they loaded Calls today, can’t make this shit up 🤣🤣🤣🤣 </td>
   <td style="text-align:left;"> 2021-12-14 06:57:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  I told you all </td>
   <td style="text-align:left;"> 2021-12-14 06:57:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 140 in cards if the bloodbath is not over soon. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I’m going to do bulls a favor here who bought the 52 week highs. Going to order myself a new iPhone 13 pro max with my 27k tendies I made shorting this. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $TSLA $AAPL $NVDA $MSFT $GOOGL 
Ain’t doing buying til the 16th….
A lot of ….. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL The market is pricing in Wednesday expected Fed meeting results, slow down tapering and no rate changes. Rate changes going up higher or faster is a surprise and could cause further downside. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL stupid bulls </td>
   <td style="text-align:left;"> 2021-12-14 06:57:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL What do you have to say... about Moon Rockets? They move quickly, and travel to Mars quite often. 🚀 🚀  That is all, Apple 12/17 expiration calls $180 are moon rockets. It&amp;#39;s pumped up with money fuel thanks to Jerome Powell, Jerome Powell save us. </td>
   <td style="text-align:left;"> 2021-12-14 06:56:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL why CNBC is making a big deal when Apple goes up but they shut up and they are happy campers when it goes down?? Biggest crooks! </td>
   <td style="text-align:left;"> 2021-12-14 06:54:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL what happens if the fed doesn’t crash the market tmrw? 🧐 </td>
   <td style="text-align:left;"> 2021-12-14 06:54:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL charts never lie and it exactly aligned with the FOMC event… MMs planned dump on retail after creating euphoria and PT hike..The more educated we get on TA, more bulls and bears can reasonably coexist and learn from each other. </td>
   <td style="text-align:left;"> 2021-12-14 06:54:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Bears where are you taking profit? </td>
   <td style="text-align:left;"> 2021-12-14 06:52:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL will cover at $150 and long there </td>
   <td style="text-align:left;"> 2021-12-14 06:52:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL strong red candles continue to hammer ah </td>
   <td style="text-align:left;"> 2021-12-14 06:52:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 🥲 </td>
   <td style="text-align:left;"> 2021-12-14 06:50:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $200 eow right bulls? </td>
   <td style="text-align:left;"> 2021-12-14 06:50:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL short term bearish, long term bearish, eventually bullish.  
 
Good luck guys! </td>
   <td style="text-align:left;"> 2021-12-14 06:49:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL This thing broke 177.70 and it got bad. That only confirmed the beginning of an even worse downturn. </td>
   <td style="text-align:left;"> 2021-12-14 06:48:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Open daily chart and look at the today&amp;#39;s candle. No need to say more </td>
   <td style="text-align:left;"> 2021-12-14 06:48:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL alright well today our clan crushed it hope you listened </td>
   <td style="text-align:left;"> 2021-12-14 06:46:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL stay Put </td>
   <td style="text-align:left;"> 2021-12-14 06:43:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $WTRH Can’t wait for next ER, Chuck E. Cheese revs going to be insane - straight moonshot to $69 followed by a buyout from $AAPL and rebrand to iWaitlongtime </td>
   <td style="text-align:left;"> 2021-12-14 06:43:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $TSLA $AAPL $BTC.X  

My thoughts on the mkt action today ... 

 I sent out a few cautionary emails to members, beginning in the pre-mkt. One stk I flagged was one I had on my &amp;quot;short stk of the week&amp;quot; last week and that&amp;#39;s TSLA. And although it was trading higher this morning, I commented that it felt very weak. And it certainly looked like this could be the day it broke below $1000 and began a pullback. But as I noted to members, it was more than TSLA. It was a strong reversal in AAPL, cryptos, meme stks, etc. It was the continued bearish breadth of the mkt. It was all that lies ahead with PPI, the Fed, and option expiration. Basically, a lot on the plate to warrant new highs. So we were setting up for a down day and a &amp;quot;wait and see&amp;quot; posture. CNBC can only trot out Tom Lee every so often. 

With the Fed and a big option expiration ahead, my guess is we finish either north of 470 or south of 460 on the SPY by Friday. For mkt bulls, the Fed better thread that needle to perfection. </td>
   <td style="text-align:left;"> 2021-12-14 06:42:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

Tuesdays are the worst specially FOMC weeks, usually drop 7-12% on average going back 1 year, look at the dates that correspond with FOMC ON THE CHART. </td>
   <td style="text-align:left;"> 2021-12-14 06:42:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 51% In 9 months, but earnings decreased </td>
   <td style="text-align:left;"> 2021-12-14 06:39:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL yessss fall my darling....fall I can scoop up some cheap $185 calls. </td>
   <td style="text-align:left;"> 2021-12-14 06:39:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL RIP low averages. So long 🥲🤭📉📉 </td>
   <td style="text-align:left;"> 2021-12-14 06:39:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL why people chase ath I don’t get it </td>
   <td style="text-align:left;"> 2021-12-14 06:38:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL drop it like its hot! </td>
   <td style="text-align:left;"> 2021-12-14 06:37:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL https://apple.news/AuYmphm0sSBCa4t85e13ZrQ </td>
   <td style="text-align:left;"> 2021-12-14 06:37:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL did news on that employee probe come out yet with apple.? </td>
   <td style="text-align:left;"> 2021-12-14 06:37:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 06:36:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  Not asking for much I just want to close my puts at 170 </td>
   <td style="text-align:left;"> 2021-12-14 06:36:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 

I noticed I tried to block alot of bears but it seem ST didn&amp;#39;t do its job well.. WTF .. did you notice? These blocked bears still come back .. </td>
   <td style="text-align:left;"> 2021-12-14 06:34:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Simulated 180.0 dollar CALLS for Tuesday&amp;#39;s open on StockOrbit.
 https://apps.apple.com/us/app/stockorbit/id1541560646 </td>
   <td style="text-align:left;"> 2021-12-14 06:34:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 10% up last week… will be red tomorrow for sure as well </td>
   <td style="text-align:left;"> 2021-12-14 06:34:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Apple is mooning because I said! 12/17 $175 calls for appl look especially hot right now, thanks to Jerome Powell secret moon mission to Mars. To the moon! Thank you Jerome Powell. </td>
   <td style="text-align:left;"> 2021-12-14 06:32:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ Reuters: Fed to pivot on inflation fears in the face of another uncertain year.
https://www.reuters.com/markets/us/fed-pivot-inflation-fears-face-another-uncertain-year-2021-12-13/ </td>
   <td style="text-align:left;"> 2021-12-14 06:32:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL this omicron fed talk is hype, WAIT TIL THE ACTUAL MEETING HAPPENS😭😭😂😂😭😭📉📉📉📉📉📉📉 </td>
   <td style="text-align:left;"> 2021-12-14 06:32:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL ticking time bomb to disaster 📉📉 </td>
   <td style="text-align:left;"> 2021-12-14 06:29:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 500M market stock. If that 🥴🥴🥴 </td>
   <td style="text-align:left;"> 2021-12-14 06:28:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $SPY Will Powell save the week.😆🤔 </td>
   <td style="text-align:left;"> 2021-12-14 06:26:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL today was light red but $QQQ looks like it can drop another 2% very easily.  Especially if $AAPL and $TSLA continue.  Good luck bulls and bears. </td>
   <td style="text-align:left;"> 2021-12-14 06:26:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL even bulls know this is red short term. Cash out on these shorts boys it’s time to feast </td>
   <td style="text-align:left;"> 2021-12-14 06:24:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 182.09….we will hit it again… and go right by. Bye bye. </td>
   <td style="text-align:left;"> 2021-12-14 06:24:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bears here are short timers. They won’t be here long. </td>
   <td style="text-align:left;"> 2021-12-14 06:23:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL if you can count on bulls for something, it’s being super dumb. $180 here we come jackasses lol </td>
   <td style="text-align:left;"> 2021-12-14 06:22:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL - looking like some big money was getting out of a lot today. </td>
   <td style="text-align:left;"> 2021-12-14 06:22:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL almost ready for a quick swing. Bull </td>
   <td style="text-align:left;"> 2021-12-14 06:22:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL @JarvisAlerts Showing us the moon potential. Where&amp;#39;s yours at @StockOrbit Show me the future friend. </td>
   <td style="text-align:left;"> 2021-12-14 06:21:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bulls less than 8 hours ago &amp;quot;bears excited over -$1.0&amp;quot; 
bulls now: </td>
   <td style="text-align:left;"> 2021-12-14 06:21:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL sold my calls at 179 . Hope we drift to 170 for new open. </td>
   <td style="text-align:left;"> 2021-12-14 06:20:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bring on $180 </td>
   <td style="text-align:left;"> 2021-12-14 06:20:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL NEW ARTICLE : Apple gets close, but ends day just shy of $3 trillion valuation https://www.stck.pro/news/AAPL/19656587 </td>
   <td style="text-align:left;"> 2021-12-14 06:19:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 165 coming? </td>
   <td style="text-align:left;"> 2021-12-14 06:18:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I just need the money moon. 12/17 $180 calls for Apple. Jerome Powells face says it all. </td>
   <td style="text-align:left;"> 2021-12-14 06:17:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL ONE AND A HALF BILLION DOLLAR DUMP AT THE CLOSE TODAY 😳🤢🤮 </td>
   <td style="text-align:left;"> 2021-12-14 06:17:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL your boy bailed out real quick lol </td>
   <td style="text-align:left;"> 2021-12-14 06:16:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $MSFT $SQ these will lead the market selloff tomorrow meanwhile apple will make it appear we are all still afloat $SPY $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 06:16:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $MSFT $SPY 

Wait for the  Powell tone on Wed. before your next move. </td>
   <td style="text-align:left;"> 2021-12-14 06:15:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL dooms day tomorrow. If u have calls you are toast !!! 170 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 06:15:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> Top Sell Flow Money - 12.13.2021 - $SPY $AAPL $NVDA $DIA via Super Stocks App </td>
   <td style="text-align:left;"> 2021-12-14 06:13:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Stock Price Predictions: Why One Analyst Just Set a Street-High Target for Apple https://investorplace.com/2021/12/aapl-stock-price-predictions-why-one-analyst-just-set-a-street-high-target-for-apple/ </td>
   <td style="text-align:left;"> 2021-12-14 06:13:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Lets pump this to 180 for the 12/17 $180 calls on Apple. Bulls never lose right? </td>
   <td style="text-align:left;"> 2021-12-14 06:13:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL can check off the 3T checkbox and start taking profits. Too high to buy rn </td>
   <td style="text-align:left;"> 2021-12-14 06:09:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL GREAT SHORT from 181.05 until Close.. GLTA </td>
   <td style="text-align:left;"> 2021-12-14 06:09:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL pull out to early oh well over 10k profit not that bad!!! 

It was fun!!! Let&amp;#39;s don&amp;#39;t again when appl hit 182 and up 

Buy long when aapp hit 160 </td>
   <td style="text-align:left;"> 2021-12-14 06:08:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $TSLA INFLATION? Buy pricing power. $AAPL $QQQ $SPY </td>
   <td style="text-align:left;"> 2021-12-14 06:07:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL This could be a month long short. Like December 2018. </td>
   <td style="text-align:left;"> 2021-12-14 06:06:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL we want every last drop 🤭 </td>
   <td style="text-align:left;"> 2021-12-14 06:05:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL fizzling out lol </td>
   <td style="text-align:left;"> 2021-12-14 06:05:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL that probe news will be probing the bulls until end of week $SPY </td>
   <td style="text-align:left;"> 2021-12-14 06:03:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL going to $160 let’s goooooo 📉📉📉🤮 </td>
   <td style="text-align:left;"> 2021-12-14 06:02:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL locked profit on some of my puts but... Riding the rest until expiration. I want to squeeze the last dime out of them 😬💵💵💵 </td>
   <td style="text-align:left;"> 2021-12-14 06:02:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $200 by end of next month </td>
   <td style="text-align:left;"> 2021-12-14 06:01:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL After a massive rally on Friday it cooled off today. Never would have guessed </td>
   <td style="text-align:left;"> 2021-12-14 06:00:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Big money dumping… </td>
   <td style="text-align:left;"> 2021-12-14 06:00:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 200C Exp:17-Mar-23 ↑↑  🚀 Total(Day): $66,018 
$AAPL 210C Exp:17-Mar-23 ↑↑  🚀 Total(Day): $57,330 
#UnusualActivity 
 
 
Sign-up free for beta ver.:https://app.jarvisalerts.com 
charts: courtesy of finviz </td>
   <td style="text-align:left;"> 2021-12-14 06:00:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 195C Exp:17-Dec-21 --  🚀 Total(Day): $34,144 
$AAPL 200C Exp:18-Mar-22 ↑↑  🚀 Total(Day): $34,500 
$AAPL 200C Exp:21-Jan-22 --  🚀 Total(Day): $35,100 
#UnusualActivity 
 
 
Sign-up free for beta ver.:https://app.jarvisalerts.com 
charts: courtesy of finviz </td>
   <td style="text-align:left;"> 2021-12-14 06:00:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Apple officially delays macOS Monterey&amp;#39;s Universal Control until spring &amp;#39;22

Another delay for one of macOS Monterey&amp;#39;s most exciting features.

https://www.google.com/amp/s/www.imore.com/apple-officially-delays-macos-montereys-universal-control-until-spring-22%3famp </td>
   <td style="text-align:left;"> 2021-12-14 06:00:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 185C Exp:17-Dec-21 --  🚀 &amp;lt;R&amp;gt; Total(Day): $112,652 
$AAPL 190C Exp:17-Dec-21 --  🚀 &amp;lt;R&amp;gt; Total(Day): $75,631 
$AAPL 190C Exp:18-Feb-22 ↑↑  🚀 Total(Day): $58,510 
#UnusualActivity 
 
 
Sign-up free for beta ver.:https://app.jarvisalerts.com 
charts: courtesy of finviz </td>
   <td style="text-align:left;"> 2021-12-14 06:00:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 180C Exp:17-Dec-21 --  🚀 Total(Day): $27,257 
$AAPL 180C Exp:21-Jan-22 --  🚀 &amp;lt;R&amp;gt; Total(Day): $196,540 
$AAPL 182.5C Exp:17-Dec-21 --  🚀 &amp;lt;R&amp;gt; Total(Day): $416,952 
#UnusualActivity 
 
 
Sign-up free for beta ver.:https://app.jarvisalerts.com 
charts: courtesy of finviz </td>
   <td style="text-align:left;"> 2021-12-14 06:00:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL lol @ bulls saying squeeze to $200 tomorrow 😂 </td>
   <td style="text-align:left;"> 2021-12-14 06:00:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Options Analysis Video: 
https://www.youtube.com/watch?v=HhL__0xHj9U </td>
   <td style="text-align:left;"> 2021-12-14 06:00:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $170 </td>
   <td style="text-align:left;"> 2021-12-14 05:59:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL opening $171 tomorrow. Downhill from here 🥴 </td>
   <td style="text-align:left;"> 2021-12-14 05:59:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL touched new high of $182.09 and 3T cap briefly, and went south. Might consolidate for a short period before the next rally, depending what Jeremy will say on Wednesday.  

Didn&amp;#39;t sell at 182 but sold at the closing today for $175.8.  Will waiting for entry price again. </td>
   <td style="text-align:left;"> 2021-12-14 05:59:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AMC $GME $TSLA $AAPL $NVDA  ALL IN! </td>
   <td style="text-align:left;"> 2021-12-14 05:59:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Nike joined the metaverse today with there acquisition of RTFKT! Let’s go apple 🍏

https://www.businesswire.com/news/home/20211213005938/en/NIKE-Inc.-Acquires-RTFKT </td>
   <td style="text-align:left;"> 2021-12-14 05:58:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $180 calls bought heavy today. Pin there on Friday. </td>
   <td style="text-align:left;"> 2021-12-14 05:58:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 170 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 05:57:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $MRNA $AAPL $TSLA $BA 
Soon
Pre-filled Syringes  with different virus vaccines will be allowed to go through airplanes 
People can jab themselves 
And then we can give ourselves boosters shots anytime of day
...coffee vaccines sodas vaccines 
Orange juice vaccines 
Purified water vaccines... </td>
   <td style="text-align:left;"> 2021-12-14 05:56:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL it’s up .10c AH, $185 tomorrow right 🤡? 🤣🤣🤣 </td>
   <td style="text-align:left;"> 2021-12-14 05:56:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $SPY $QQQ + </td>
   <td style="text-align:left;"> 2021-12-14 05:56:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY Nose diving into open and it may recover but if you held calls overnight it’s literally zero now $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 05:55:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Hello, my name is Chamath and I like this SPAC. I said I would eat my cashmere sweater if my call options at 180 didn&amp;#39;t pan out. I wanted you to know that my cashmere is of the finest quality I could fine. It is fuchsia in color and from Inner Mongolia. I got it there while DeSPAC&amp;#39;ing a goat company on the Mongolian Stock Market. I used Grey Poupon moutarde to give it some added flavor and to keep the calories down. I need to maintain my 11% body fat. By the way, you should listen to my pod! </td>
   <td style="text-align:left;"> 2021-12-14 05:54:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL institutes just unloaded TF out of retail today esp. during &amp;quot;SOUR HOUR&amp;quot; - they know what&amp;#39;s brewing on that FOMC meeting . </td>
   <td style="text-align:left;"> 2021-12-14 05:54:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Gamma Squeeze coming. </td>
   <td style="text-align:left;"> 2021-12-14 05:54:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I swear half these bulls just say things with no reason. Why should AAPL be at this level right now? </td>
   <td style="text-align:left;"> 2021-12-14 05:54:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL fomo buyers 180+ lol 😂 🤣🤣🤣 </td>
   <td style="text-align:left;"> 2021-12-14 05:52:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL expect to see small rally tomorrow in overall market and this turd to $179-181. But if not , oops $165-168 💯. My $175 estimate for Tuesday came early. </td>
   <td style="text-align:left;"> 2021-12-14 05:52:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL gapping up tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 05:51:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Motherfuckers crowding my trade </td>
   <td style="text-align:left;"> 2021-12-14 05:51:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL Cramer said Buy Apple so I shorted it </td>
   <td style="text-align:left;"> 2021-12-14 05:50:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL lol so that dude elprup will comment on your post (highlighting the massive call buying actually being bearish) &amp;amp; then proceed to block you?? I brought actual evidence not just posting ‘I hope this tanks’ lol what a giant puss. F**k his dog too </td>
   <td style="text-align:left;"> 2021-12-14 05:50:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Sell the rips </td>
   <td style="text-align:left;"> 2021-12-14 05:50:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL what a surprise, I thought STONKS ONLY GO UP? </td>
   <td style="text-align:left;"> 2021-12-14 05:49:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 120 end of year? </td>
   <td style="text-align:left;"> 2021-12-14 05:49:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 170 eod tmm </td>
   <td style="text-align:left;"> 2021-12-14 05:49:01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 175.64.74 bottom? What do you think? </td>
   <td style="text-align:left;"> 2021-12-14 05:48:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL ok the fuck you candle seems to have arrived today.. </td>
   <td style="text-align:left;"> 2021-12-14 05:48:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Were Pumping this to the moon 12/17 expiration $180 Calls </td>
   <td style="text-align:left;"> 2021-12-14 05:48:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Check the selling volume by 4 PM. Huge red volume candle. Mostly smart institutions out of positions now. Waterfall tomorrow, no one is gonna catch the knife above $150 value. </td>
   <td style="text-align:left;"> 2021-12-14 05:48:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Yes I don’t give a fuck if 401ks get wrecked for a minute. They always rebound 😂 </td>
   <td style="text-align:left;"> 2021-12-14 05:48:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL might pull back like 09/02/2020. Estimate that might fall 9% </td>
   <td style="text-align:left;"> 2021-12-14 05:47:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $QQQ $AAPL CNBC: El-Erian says &amp;#39;transitory&amp;#39; was the &amp;#39;worst inflation call in the history&amp;#39; of the Fed.
https://www.cnbc.com/2021/12/13/el-erian-says-transitory-was-the-worst-inflation-call-in-the-history-of-the-fed.html </td>
   <td style="text-align:left;"> 2021-12-14 05:47:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL </td>
   <td style="text-align:left;"> 2021-12-14 05:47:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL this is Apples current run next to its last run, we see the dip then the next rip. When I’m doubt look at the previous price action to see how it follows. Buying calls here for free money. Bear trap in full effect 🪤 </td>
   <td style="text-align:left;"> 2021-12-14 05:47:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL with all the momentum apple is due for a pull back analysts said!! </td>
   <td style="text-align:left;"> 2021-12-14 05:47:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bears got one day right after being wrong all week last week. </td>
   <td style="text-align:left;"> 2021-12-14 05:45:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY TODAYS THE FIRST DAY I COULD AFFORD STEAK FOR DINNER. THANKS FOR THE MONEY BULLS IT WAS MUCH NEEDED $AAPL $QQQ </td>
   <td style="text-align:left;"> 2021-12-14 05:45:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL wow our boards been invaded by a bunch of crazies. Enjoy the ride for now. It won’t last long. </td>
   <td style="text-align:left;"> 2021-12-14 05:44:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL im up 150% who cares ? Buy and forget </td>
   <td style="text-align:left;"> 2021-12-14 05:43:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL tells you why it&amp;#39;s not tanking after hours lmfao </td>
   <td style="text-align:left;"> 2021-12-14 05:43:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $QQQ $AAPL ) </td>
   <td style="text-align:left;"> 2021-12-14 05:43:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL wtf lol </td>
   <td style="text-align:left;"> 2021-12-14 05:43:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL wow this is gonna tank tomorrow

Loaded 165 puts at the top </td>
   <td style="text-align:left;"> 2021-12-14 05:42:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL  You were warned. Just look at that bearish engulfment at the top of the linear regression channel. Posted it this morning &amp;amp; last week. It was a mathematical TA certainty. It&amp;#39;s going to 158. Pullbacks technically sink to breakout points. It is overbought &amp;amp; overextended. </td>
   <td style="text-align:left;"> 2021-12-14 05:42:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $QQQ $SPY $AAPL # </td>
   <td style="text-align:left;"> 2021-12-14 05:41:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL lmao...just a week ago the same bears celebrating now, are the same bears who were screaming that 175 wasn&amp;#39;t going to happen 😂😂

I&amp;#39;m really glad you made your money back! Now go buy ITM SPY puts 😂😂

Always long term bullish on apple. Who cares where it goes? You can simply add huge pull backs and nothing else, long term you&amp;#39;ll be up big regardless. Just don&amp;#39;t go all in at the top like so many of yall do 😂😂 </td>
   <td style="text-align:left;"> 2021-12-14 05:41:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $SPY $AAPL To those who haven’t figured it out yet, the news is fake and the narrative is bullshit. </td>
   <td style="text-align:left;"> 2021-12-14 05:41:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bring me to $168!!!! 😁 </td>
   <td style="text-align:left;"> 2021-12-14 05:39:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL NEW ARTICLE : What New Metaverse ETFs Mean for Investors https://www.stck.pro/news/AAPL/19656037 </td>
   <td style="text-align:left;"> 2021-12-14 05:39:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Glad I shorted some calls with my short position too. Don’t forget to buy the dip bulltards </td>
   <td style="text-align:left;"> 2021-12-14 05:38:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Don&amp;#39;t listen to the people on TV ... unless you own more than 10% of AAPL, you have to own it at any price! </td>
   <td style="text-align:left;"> 2021-12-14 05:38:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL tomorrow we ride down to $160!! </td>
   <td style="text-align:left;"> 2021-12-14 05:37:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $BA $AAPL $TSLA $MRNA 
Delta virus + HIV = Omicron 
Delta alone = quicker death
Delta + HIV = the walking dead
We become 
We even made movie + tv show </td>
   <td style="text-align:left;"> 2021-12-14 05:36:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 
157$ soon
Gap must fill </td>
   <td style="text-align:left;"> 2021-12-14 05:36:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $2-3 gap down, $170 EOD tomorow, Wed is anyones guess but likely  VERY VERY VERY bloody day rug pull on whole market </td>
   <td style="text-align:left;"> 2021-12-14 05:36:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> 5-Day Equity Sentiment Recap: $AAPL is the #1 stock that institutions are trading over rolling 5 day window with 1.5M options contracts.

Market analysis included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 05:36:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL let me help the idiots wishing bad on 🍏
Had you bought in 1989 and held this is what happened
2/1…2/1…2/1…4/1….7/1….
Put that in the ole pipe n smoke it…
The joke is on the ones that dont long term hold </td>
   <td style="text-align:left;"> 2021-12-14 05:35:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL - let’s get another -1% by close </td>
   <td style="text-align:left;"> 2021-12-14 05:35:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL 190-200 end of December </td>
   <td style="text-align:left;"> 2021-12-14 05:34:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $180 tomorrow no stop loss. </td>
   <td style="text-align:left;"> 2021-12-14 05:34:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL bulls </td>
   <td style="text-align:left;"> 2021-12-14 05:34:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL loaded $185 strike calls for Dec 23rd week ! </td>
   <td style="text-align:left;"> 2021-12-14 05:34:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL gonna be a lot of broke 20 year olds soon offering up their NFTs for a job soon. </td>
   <td style="text-align:left;"> 2021-12-14 05:34:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL is the MEME stock. Not $GME or $AMC . U dont need to trust me. </td>
   <td style="text-align:left;"> 2021-12-14 05:34:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL apple is no longer a tech company they are a technology company </td>
   <td style="text-align:left;"> 2021-12-14 05:34:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL who else loaded calls eod? </td>
   <td style="text-align:left;"> 2021-12-14 05:34:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL $165 tomorrow quite likely </td>
   <td style="text-align:left;"> 2021-12-14 05:33:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL I said yesterday retrace to 175-176 </td>
   <td style="text-align:left;"> 2021-12-14 05:32:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Bought at 150, sold half at 181.81, guess miracles do happen lmao, sometimes timing the market is possible, for once i got lucky, hurray </td>
   <td style="text-align:left;"> 2021-12-14 05:32:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL In case all you Asswipe no Nothing Bullshit Bears !! The entire market is RED . Please short so I can load MORONS only talk Shit on down days . WOW such Market incite 🤔 </td>
   <td style="text-align:left;"> 2021-12-14 05:32:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL AAPL 2021-12-13 Dark Pool &amp;amp; Short Interest Data: 
https://www.youtube.com/watch?v=T9eXSwSV71I </td>
   <td style="text-align:left;"> 2021-12-14 05:32:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL The people selling said it would go up lol. Hedge for the love of god, it has to gap fill at 165. Markets manipulated posts are going to come in, When whales tell you to buy its because they have too much stock and can&amp;#39;t get out without the euphoria that pulls everyone in. </td>
   <td style="text-align:left;"> 2021-12-14 05:31:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AAPL </td>
   <td style="text-align:left;"> $AAPL Bear clowns are on this thread now like flies to a pile of cow sh+t. Apple to $140...it will go to $120....I&amp;#39;m a buyer at $90. What a bunch of idiots. </td>
   <td style="text-align:left;"> 2021-12-14 05:31:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $LCID there is only one EV company out there that will really compete tow to tow with $TSLA in the next couple of years, and that is $NIO but the only problem with that is that has a lot of hate around because is a Chinese one. </td>
   <td style="text-align:left;"> 2021-12-14 09:02:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA TSLA 2021-12-13 Dark Pool &amp;amp; Short Interest Data: 
https://www.youtube.com/watch?v=dlaFi8eUEqs </td>
   <td style="text-align:left;"> 2021-12-14 09:02:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA - Buying below $1000. </td>
   <td style="text-align:left;"> 2021-12-14 09:02:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Simulated 975.0 dollar CALLS for Tuesday&amp;#39;s open on StockOrbit.
 https://apps.apple.com/us/app/stockorbit/id1541560646 </td>
   <td style="text-align:left;"> 2021-12-14 09:01:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 

8 long yrs trading this &amp;amp; holding - do I know the stock ?! 

I hope I’m wrong this time !!👇

🙏🏻🐉🦅 </td>
   <td style="text-align:left;"> 2021-12-14 09:00:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AAPL $TSLA $UPST In trying times you can either be POSITIVE or NEGATIVE.  I choose positive every time.  Negativity may thrive short term but OPTIMISM THRIVES.  BUY &amp;amp; HODL during these times.  Watch the bears eventually flush out.  Most of these &amp;quot;bears&amp;quot; don&amp;#39;t even have any skin in the game.  You can tell how uninformed and dumb they are by their posts and comments. </td>
   <td style="text-align:left;"> 2021-12-14 08:59:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA    Just sucks cause it drags the entire Nasdaq down with it until equilibrium </td>
   <td style="text-align:left;"> 2021-12-14 08:58:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SKLZ buy stocks that your wife likes. Best advice ever! 🤣 $TSLA $AAPL $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 08:58:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> #Leaderboard stock #Tesla struggled Monday. It closed down 5%

A Bearish move below its 50-Day MA saw exposure to the stock trimmed on the prestigious IBD Leaderboard list of Top stocks

$TSLA </td>
   <td style="text-align:left;"> 2021-12-14 08:58:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $SPY Interesting but probably doesn&amp;#39;t mean much considering all the Brrrrrrrrrrrrrrrrrrrrrrrrrrrr </td>
   <td style="text-align:left;"> 2021-12-14 08:58:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I hope this guy fkin prints tomorrow!! </td>
   <td style="text-align:left;"> 2021-12-14 08:56:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA food for thought....when you cant admit when you were wrong then why even bother posting at all? </td>
   <td style="text-align:left;"> 2021-12-14 08:56:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA gettn slaughtered tmr. No visible support on the 3m chart other than todays low of day. </td>
   <td style="text-align:left;"> 2021-12-14 08:56:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Elon selling the top to fan boy bag holders while exercising $6.24 options 🤷‍♂️ that’s the buy back boys $6 freaking dollars </td>
   <td style="text-align:left;"> 2021-12-14 08:56:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA     I’ll buy back in at the ipo price next few months 

https://www.barrons.com/articles/tesla-stock-price-nasdaq-cisco-technicals-51639184156?siteid=yhoof2 </td>
   <td style="text-align:left;"> 2021-12-14 08:55:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $ARVL people are complaining about profit and revenue. You should look at company technology, products, partnership, and over 2k employees plan for global expansion.  

This is start-up company - went public earlier than they should have been but in my opinion, this is great opportunity to be early investor at market cap under 4.5 BN. Ask $TSLA early investor who bought stock around $17 at IPO </td>
   <td style="text-align:left;"> 2021-12-14 08:55:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Big whales unloading .  Lookout below.  I don’t see any giga pumping news to slow that down 😅😀😂🤑🤣😆💲💰💲💰 </td>
   <td style="text-align:left;"> 2021-12-14 08:53:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I be Stalking on Tesla from now on 

  🧞‍♂️💲🎄 $SPY $SPX $ES_F  in here Dec 13th </td>
   <td style="text-align:left;"> 2021-12-14 08:53:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA you boys have been hoodwinked </td>
   <td style="text-align:left;"> 2021-12-14 08:53:35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 915 open pl </td>
   <td style="text-align:left;"> 2021-12-14 08:53:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA  y </td>
   <td style="text-align:left;"> 2021-12-14 08:52:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $QQQ $SPY $SNOW $TSLA $IWM  🔥🔥🔥🥵 Just  started the 🩸 </td>
   <td style="text-align:left;"> 2021-12-14 08:52:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA https://youtu.be/BJCxaflJhEQ </td>
   <td style="text-align:left;"> 2021-12-14 08:52:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA ignore the noise and trade the chart. </td>
   <td style="text-align:left;"> 2021-12-14 08:52:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA did Elon sell today? </td>
   <td style="text-align:left;"> 2021-12-14 08:51:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> (4) Finally, one last thing I&amp;#39;m trying to focus on is ensuring I size appropriately for my account. A big part of that is not purchasing contracts I can&amp;#39;t get at least 2 of. This allows me to hold a runner and let it go when I hit on something, which I&amp;#39;ve seen is where some of my biggest gains occur. This has the added benefit of not allowing me to play too heavily in big ticker weeklies ($SHOP, $TSLA, $AMZN) where I have repeatedly been burnt for large portions of my trading account in the past.

For reference, I trade using a small account right now, average balance around $5K. I intend to rinse my profits every $2K gains, taking $1K off the table to my checking account and letting $1K stay in order to grow my trading portfolio. To date I&amp;#39;ve only rinsed twice although I didn&amp;#39;t start seriously formulating a strategy until a month or two ago. My long investments are all in my IRA/401K although I do have a separate account that holds mostly shares. </td>
   <td style="text-align:left;"> 2021-12-14 08:50:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA shorts in blackout period </td>
   <td style="text-align:left;"> 2021-12-14 08:49:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 08:49:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA could it ever go as low as 100 yes,no, why?

https://www.youtube.com/watch?v=O9fsYgCi_SE </td>
   <td style="text-align:left;"> 2021-12-14 08:48:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA futures are up and Tesla still going down after hours. Expect more selling tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:48:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $HOOD $TSLA $NIO $PLTR Shorts are all in the market right now. Sounds like longs earlier this year in February before they got creamed. Do the shorts not see what’s going to happen soon? </td>
   <td style="text-align:left;"> 2021-12-14 08:48:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA   Buy back after bubble pops or just hold long term bags if you can stomach it.  But a stock like Tesla is not fed proof and the warning signs are screaming red. 

https://www.marketwatch.com/story/expect-a-near-term-stock-pullback-then-a-bubble-not-seen-in-100-years-heres-how-to-start-preparing-11639398418?siteid=yhoof2 </td>
   <td style="text-align:left;"> 2021-12-14 08:48:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA We’ll I guess “conventionality is so yesterday …and the word is Musk.”
    I find myself in category of  long and strong with this one and lean towards the view that EM knows what he’s doing so I’ve got the bow turned into the wind to weather the chop. I’ve  also seen this movie before with Amazon Google Apple and Microsoft. With those previous holdings I basically took the money and ran… regrettably ..still holding smaller positions … I’ve been increasing my TESLA  position during these dips. being up over 300k overall since 1/21… I have that “deja vu all over again” feeling in this regard.
   I believe that when the 2 new Giga’s go Gaga in the near future and we see 4Q results a lot of people will be  regretting missed opportunities 
    Remember this…. This company is unique and most so called experts of Wall Street aren’t really that expert… otherwise they’d be hauling in mega cash on the stern of their 100 foot yachts bird watching.
. </td>
   <td style="text-align:left;"> 2021-12-14 08:47:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA profits from 18 months cut in half in a couple days…i didn’t sign up for this </td>
   <td style="text-align:left;"> 2021-12-14 08:47:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA omg 😳

http://nixle.us/DAFTK </td>
   <td style="text-align:left;"> 2021-12-14 08:47:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA so much money was made here for years by longs but all good things must end… </td>
   <td style="text-align:left;"> 2021-12-14 08:47:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Remember bears, when you see a bandwagon, it&amp;#39;s too late to jump on. </td>
   <td style="text-align:left;"> 2021-12-14 08:46:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA overpromise under deliver Elon now selling captured CO2 for rocket fuel lol where FSD , cyber truck , semi truck , insurance …… </td>
   <td style="text-align:left;"> 2021-12-14 08:46:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AABB $SPY $TSLA $AAPL $BTC.X The&amp;gt; GOLDEN CROSS Coming &amp;amp; fianchill PT 1.79$ BOOM Coming https://aabbgoldtoken.com/uncategorized/asia-broadband-sets-december-launch-date-for-proprietary-cryptocurrency-exchange/2021/12/08/ </td>
   <td style="text-align:left;"> 2021-12-14 08:46:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA some interesting points for shorts to sleep well 🤣  https://twitter.com/garyblack00/status/1470552201936392194?s=12 </td>
   <td style="text-align:left;"> 2021-12-14 08:46:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 400 at open tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:46:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA     Valuation dropping.   Bear market ahead for Tesla. 

https://www.marketwatch.com/story/tesla-slides-into-bear-market-territory-as-valuation-falls-below-1-trillion-11639428651?siteid=yhoof2 </td>
   <td style="text-align:left;"> 2021-12-14 08:45:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA nice!! 2 scoops por favor </td>
   <td style="text-align:left;"> 2021-12-14 08:45:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA DOOOMMMM </td>
   <td style="text-align:left;"> 2021-12-14 08:45:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Now a Steal Under 1 Trillion 🧞‍♂️

$spy $spx $es_f $dia </td>
   <td style="text-align:left;"> 2021-12-14 08:45:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA level 200?

https://www.youtube.com/watch?v=zdnwafYzIIw </td>
   <td style="text-align:left;"> 2021-12-14 08:45:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA what the fuck man </td>
   <td style="text-align:left;"> 2021-12-14 08:45:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Amazing company 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 08:45:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA amazing man 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 08:44:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AAPL $TSLA $UPST 

The fear of omicron has been put in us as well as the fear of not being vaccinated.  Here&amp;#39;s the interesting thing - most omicron cases in the US have been hit by those who are fully vaccinated.  Isn&amp;#39;t that something.  We need more vaccines now Im guessing.

https://www.reuters.com/world/us/most-reported-us-omicron-cases-have-hit-fully-vaccinated-cdc-2021-12-10/ </td>
   <td style="text-align:left;"> 2021-12-14 08:42:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA PPI inflation tomorrow

Delivery 01-04-22 ; about 2+ weeks  from now !

Mssk gives a cybertruck timeline on 01-26-22 - about 5 weeks from now!! </td>
   <td style="text-align:left;"> 2021-12-14 08:41:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 300 by EOY 2022?

https://www.youtube.com/watch?v=kfGJLhEqj0s </td>
   <td style="text-align:left;"> 2021-12-14 08:40:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA gap fill is coming from the looks of it AH its looking nasty just brace for it maybe hedge your position with some puts for insurance  for the short term pain </td>
   <td style="text-align:left;"> 2021-12-14 08:40:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AEI No offerings for a while only smooth sailing from here on💪🏼 If news with $TSLA drops there will be no stopping this🚀 $ATER </td>
   <td style="text-align:left;"> 2021-12-14 08:39:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Potential bullish engulfing or harami candle set up then all time squeeze. Snagged shares after hours closed short  $UPST $GME $AMC $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 08:39:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA how many shares still left for Elon to sell to stop this ?? </td>
   <td style="text-align:left;"> 2021-12-14 08:38:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 400 by Sept 25th 2022?

https://www.youtube.com/watch?v=0YdRJTJ32dA </td>
   <td style="text-align:left;"> 2021-12-14 08:38:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA so 13 trading days left for elon to sell approximately 6 million shares + powell to announce faster taper and intrest rates.

Shits about to dump hard

$750 by end of year
$600 mid feb 22 </td>
   <td style="text-align:left;"> 2021-12-14 08:38:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA is favoured to move higher in the longer cycles.  But it is pulling back right now, and has made new cycle lows today, we do NOT like to short sell this name, only like to buy in 3 7 or 11 swing.  The 931 area can provide a bounce in 3, 7 or 11 swing.  #Ellliottwave #Trading #stocks </td>
   <td style="text-align:left;"> 2021-12-14 08:37:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA --&amp;gt;  Oppenheimer sees a 13% S&amp;amp;P 500 gain next year on a resilient economy, strong earnings https://cnb.cx/3s6GeHM </td>
   <td style="text-align:left;"> 2021-12-14 08:37:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY $NVDA $AMZN $TSLA looks like the fed trapped themselves and the market has identified it. Refuse to accelerate the taper, have massive inflation caused by the fed. Taper, and the market collapses. Fed refused to pull out of the market after the financial crisis, this could get nasty </td>
   <td style="text-align:left;"> 2021-12-14 08:36:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA another snake oil sales pitch to fan boys to capture CO2 for rocket fuel 😂 how brilliant </td>
   <td style="text-align:left;"> 2021-12-14 08:35:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Oppenheimer sees a 13% S&amp;amp;P 500 gain next year on a resilient economy, strong earnings https://cnb.cx/3s6GeHM </td>
   <td style="text-align:left;"> 2021-12-14 08:34:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 

The stock market is a game of mental toughness. Who cracks first

Who buys when there is blood on the street

Folks who buy when there is blood on the streets are the ones that are on vacation when the streets are clean🤔

Remember when covid hit and the market was decimated….don’t panic buy </td>
   <td style="text-align:left;"> 2021-12-14 08:34:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA https://www.tesmanian.com/blogs/tesmanian-blog/tesla-china-integrates-anti-iceing-floor-lock-system-unlocking-into-its-application-how-it-works 🏎🚀🤖🔋 </td>
   <td style="text-align:left;"> 2021-12-14 08:33:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA pretty simple strategy bears. Play for the 910 gap fill as long stays under 50 day. Give it up if they retake the 50. Also close puts down tomorrow if get that big open dive to the gap close </td>
   <td style="text-align:left;"> 2021-12-14 08:32:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA love my tsla love low floats $FATBB up 627% in revenue year to date also would bet my money on $DKNG </td>
   <td style="text-align:left;"> 2021-12-14 08:32:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 500 by May 14th?

https://www.youtube.com/watch?v=ioALzM98jaQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $ARKX Elon Musk: &amp;quot;SpaceX is starting a program to take CO2 out of atmosphere &amp;amp; turn it into rocket fuel.&amp;quot; </td>
   <td style="text-align:left;"> 2021-12-14 08:32:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA When TIME finally got it right for Person of The Year! Cry wokes! Cry! </td>
   <td style="text-align:left;"> 2021-12-14 08:32:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $AAPL $SPY $QQQ $DIA  

https://apple.news/AVSGYxVxYQmWGVFiB5JXQZQ </td>
   <td style="text-align:left;"> 2021-12-14 08:32:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ $SQQQ $DIA  

https://apple.news/A9UYr_fp3T4eacrtuNXP64A </td>
   <td style="text-align:left;"> 2021-12-14 08:30:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $MARA $OCGN $TSLA all these dips will mean nothing when we are passed out ath in 2022 </td>
   <td style="text-align:left;"> 2021-12-14 08:30:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Snoop Dogglas will catch Ejaw </td>
   <td style="text-align:left;"> 2021-12-14 08:30:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA takes balls to invest in a company with an autistic ceo we can do it bulls 🚀🦍 </td>
   <td style="text-align:left;"> 2021-12-14 08:30:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA here come the random pt’s 😂 </td>
   <td style="text-align:left;"> 2021-12-14 08:29:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA only I could still find a way to lose a money on this today buying puts smh... unbelievable. </td>
   <td style="text-align:left;"> 2021-12-14 08:29:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Only stock you need. </td>
   <td style="text-align:left;"> 2021-12-14 08:29:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA spilt announce is coming  this week </td>
   <td style="text-align:left;"> 2021-12-14 08:28:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> If you missed alerts today or have been trying to see what I’m trading in real time. JUST SEE MY BIO, I pride myself on coaching and teaching as many traders as I can. Let’s crush the volatility this week, fed meeting, inflation all time high, tons of overvalued names, undervalued names. Let’s keep a sharp eye for reversals. Have a great night SEE You all tmrw. $BFRI $SEAC $COIN $PTON $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 08:28:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 1020 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:28:20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA bear trap with low ah volume. 🚀 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:27:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA patience is the key 🔑 </td>
   <td style="text-align:left;"> 2021-12-14 08:27:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA musk sold at the top. </td>
   <td style="text-align:left;"> 2021-12-14 08:27:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 
Still going brrrrrrrrr </td>
   <td style="text-align:left;"> 2021-12-14 08:27:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 600 by April 1? </td>
   <td style="text-align:left;"> 2021-12-14 08:27:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 700 Club in Q1/2022.

https://www.youtube.com/watch?v=xpsrSfCz3LA </td>
   <td style="text-align:left;"> 2021-12-14 08:25:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Ok bears this is your discount,now shut the f up and buy!! </td>
   <td style="text-align:left;"> 2021-12-14 08:25:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Elon sells more his shares for 5-6weeeks from now </td>
   <td style="text-align:left;"> 2021-12-14 08:24:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $Tsla $UPST if you are bulls and days like today happen I would avoid boards like this.  It&amp;#39;s primetime for negativity to spread and all kinds of wild speculation that will just make you panic and think about selling.  Don&amp;#39;t come on here if you have a weak stomach !!! These keyboard warriors love to put people in fear.  No self respecting person comes on here talking crazy.  Keep that in mind !! </td>
   <td style="text-align:left;"> 2021-12-14 08:23:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Buying more in the low $900s. If it goes back to $850, I&amp;#39;m all in. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA hmm I only have a few shares but they are over the 1k mark. I wonder if it merits coming back at a lower level....I guess it all depends on Powell as to witch way this goes... </td>
   <td style="text-align:left;"> 2021-12-14 08:23:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY $AAPL $MSFT $TSLA $AMZN Fed meeting tomorrow and Omicron is back with more deaths. </td>
   <td style="text-align:left;"> 2021-12-14 08:23:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA SNBL. Sell Now Buy Later </td>
   <td style="text-align:left;"> 2021-12-14 08:22:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA added a little bit today. </td>
   <td style="text-align:left;"> 2021-12-14 08:22:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA who is drunk? Lol me. Im laughing because i literally paid for my entire trip today here with barely playing. Going to miss these times whenever they end. We have dipped too many times that i feel this time they fill the gap </td>
   <td style="text-align:left;"> 2021-12-14 08:22:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $984+ tomorrow 🧙🏻‍♀️ </td>
   <td style="text-align:left;"> 2021-12-14 08:21:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA the stimulus party is over fan boys  😎 look at all the other tech stocks that tanked 50% plus do you really think Tesla is immune 😂 </td>
   <td style="text-align:left;"> 2021-12-14 08:20:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 800 EOY? </td>
   <td style="text-align:left;"> 2021-12-14 08:20:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY auuu my SWING PUTS were golden💰💸 from Friday and good thing they don&amp;#39;t exp until DEC 17, so no rush to close all them out... I love it when an OBVIOUS plan comes together🤑.. Bulls are perplexed and got hot coals 🔥raked across their backs.. 🙃🥵😂 
PUTS PRINTING 💦💦💦👱‍♀️

Told yall $AAPL was a clear target Friday and over the weekend, $TSLA couldn&amp;#39;t hold $1000 signaling massive dump to come to low $900s, $PTON saved temporarily by technicals and value flow of Covid plays $QQQ will be taken to the woodshed 🤣 OOF! 

(TAPER TAPER TAPER RATE HIKE RATE HIKE RATE HIKE⬆️⬆️⬆️ 😆🙋🎯📉) FUTURES smell like vinegar and ammonia for bulls ☢😁 </td>
   <td style="text-align:left;"> 2021-12-14 08:18:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY $TSLA $AAPL $QQQ $NDX . </td>
   <td style="text-align:left;"> 2021-12-14 08:18:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I’m not one to cash out of my positions, especially when I’m down, but this one is on the edge of a cliff that leads straight to 600s…. Took my lumps and went elsewhere, may come back in a few months </td>
   <td style="text-align:left;"> 2021-12-14 08:18:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA very soon. </td>
   <td style="text-align:left;"> 2021-12-14 08:18:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA not sure why so many are flipping out.  Tsla has a pattern of going up down up down.  It went down a little bit more than usual but not much.  It will be back up in a day or two.  Bears/shorts and negative people who don&amp;#39;t have any stock love to come on here and make people who are invested panic. Don&amp;#39;t sell.  If anything wait to buy more on good dips. </td>
   <td style="text-align:left;"> 2021-12-14 08:16:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA you better be buying puts this week!!! Whole market will be trending downward and this is already over priced. </td>
   <td style="text-align:left;"> 2021-12-14 08:16:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $55 generous value </td>
   <td style="text-align:left;"> 2021-12-14 08:16:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA took my money to penny stocks runners, making way more than this pos mover. </td>
   <td style="text-align:left;"> 2021-12-14 08:15:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA bleeding AH as it didn’t eat enough shit already </td>
   <td style="text-align:left;"> 2021-12-14 08:15:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Great opportunity to load the boat. Entered bull put spread for TSLA on a red Monday. Its now at strong support. Have a great week ahead.

https://www.noobsellingoptions.com/post/tsla-bull-put-spread-added-more </td>
   <td style="text-align:left;"> 2021-12-14 08:15:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA When is the next split? 😅 </td>
   <td style="text-align:left;"> 2021-12-14 08:15:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA looks like he didnt sell today as no form 4 filed yet.

Only 6 million shares left to sell 😳 </td>
   <td style="text-align:left;"> 2021-12-14 08:15:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> latexc8f0d6b96323da4a0f81f68805e6b1efTSLA 1.07m (47% call/53% put)
$AMC 794k (51% call/49% put) </td>
   <td style="text-align:left;"> 2021-12-14 08:12:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $MSFT $AAPL $AMZN latex2dba9ed9f68505fd109504fcb4efa359AMC - 86% put flow
$AMD - 70% call flow </td>
   <td style="text-align:left;"> 2021-12-14 08:12:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA  risky behavior from Person of times of year .. short interest decreasing .. he must have completed last chunk of dump ...  
... 
 
Sheeps buying ... lol </td>
   <td style="text-align:left;"> 2021-12-14 08:11:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Pull back from high of Jan this year to low May was approx 35%; if same applies this time we would be sub $800 </td>
   <td style="text-align:left;"> 2021-12-14 08:10:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA good news is telsa will capture majority share of EV market .The Bad news is ,it don&amp;#39;t matter in a bear market. </td>
   <td style="text-align:left;"> 2021-12-14 08:10:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Sweep Options Activity: $TSLA is the #6 ticker with sweep activity where institutions are trading options urgently with 20.9K sweep contracts, a leading indicator of market movement.

Market analysis and options contracts included in screenshot of dashboard from http://insiderfinance.io. </td>
   <td style="text-align:left;"> 2021-12-14 08:09:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 🎶 “I can’t quit you baby, but I’m going to have to put you down for a while.” 🎶
- Willie Dixon </td>
   <td style="text-align:left;"> 2021-12-14 08:09:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA gonna go down tomorrow faster than a barefoot girl from Staten Island </td>
   <td style="text-align:left;"> 2021-12-14 08:09:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA not much to be said about the first couple hours of the day - it went down hard. Got caught in some relative chop throughout the rest of the day, closing below VPC @ 966.18 and continuing to drop AH. Today&amp;#39;s low of 951.42 is only 7.22 above the top of the 25-Oct gap. All of my indicators are saying sellers are firmly in control and there&amp;#39;s more downside. Levels I&amp;#39;m watching: 944.50; 943.00 (avwap); 910.00 (bottom of gap); 895.00; 873.00; and if it gets that weak, 23-Aug VPC @ 784.50. There may be a run higher after the gap fills, and if so I&amp;#39;d be watching 945.50, 952.00; and anything above 987.70 with confirmation I&amp;#39;d be looking long to about 1040.00. </td>
   <td style="text-align:left;"> 2021-12-14 08:09:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Kia EV or Tesla EV or Hyundai&amp;#39;s EV ?? which car 🚘 manufacturer offers a better EV ?? </td>
   <td style="text-align:left;"> 2021-12-14 08:08:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA slaughter fest! 910 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:08:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $287 billion wiped out of retail bag holders accounts in 5 weeks and change. </td>
   <td style="text-align:left;"> 2021-12-14 08:08:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> From a business business trip to Alaska, I learned that people here really have a great sense of humor. 
The only correct way to use bathroom here is to be a human, not peek into other peoples&amp;#39; stalls, and to not be a moose. It&amp;#39;s that simple!  
  
$AAPL $TSLA $SPY $AMD $AMZN </td>
   <td style="text-align:left;"> 2021-12-14 08:08:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 600$ fair value </td>
   <td style="text-align:left;"> 2021-12-14 08:07:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Hedge fund short sellers being targeted by DOJ in new sweeping criminal investigation https://youtu.be/Ys4LBZ7OGLI </td>
   <td style="text-align:left;"> 2021-12-14 08:07:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $900 tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 08:06:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA traders today </td>
   <td style="text-align:left;"> 2021-12-14 08:06:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $925 tomorrow… </td>
   <td style="text-align:left;"> 2021-12-14 08:06:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $996+ tomorrow 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 08:05:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA ... </td>
   <td style="text-align:left;"> 2021-12-14 08:05:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $GGPI $LCID $TSLA $FSR $RIVN 

Polestar is an Interesting pick out the of the Electric vehicle crowd .. 

https://investorplace.com/2021/12/ggpi-stock-is-an-intriguing-pick-out-of-the-electric-vehicle-crowd/ </td>
   <td style="text-align:left;"> 2021-12-14 08:04:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA funny thing is we all talk big about drop now but it’ll rise fast too. I hope to catch it </td>
   <td style="text-align:left;"> 2021-12-14 08:01:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA let’s see if the 7pm spike does anything </td>
   <td style="text-align:left;"> 2021-12-14 08:00:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $ESSC $STRN $PTON $AMZN $TSLA 
💰WOOF </td>
   <td style="text-align:left;"> 2021-12-14 08:00:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Mercedes is not a &amp;#39;Tech&amp;#39; company and Tesla is not an &amp;#39;Empty-Promises&amp;#39; company Elon4President24&amp;#39; </td>
   <td style="text-align:left;"> 2021-12-14 07:59:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $NKLA $TSLA Let me take a moment to bury some more Diesel Engine&amp;#39;s and Diesel Particular Filter DPF systems.🙋⚡🔋 </td>
   <td style="text-align:left;"> 2021-12-14 07:58:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Blow it out your self serving ass Mars Boy Elon ... seek help idiot ... recent tweet by the marsass  ... &amp;quot;#Elon #Musk ... 
@elonmusk  1h  SpaceX is starting a program to take CO2 out of atmosphere &amp;amp; turn it into rocket fuel. Please join if interested.&amp;quot; ... $tsla $arkk $spy $qqq $SPX  https://mobile.twitter.com/elonmusk ... carry on sticking forks in this overpriced p o s TESLA for profits re due diligence  ... tdtiahth @Profit_Maker https://stocktwits.com/Profit_Maker 🐻❤😈✔ </td>
   <td style="text-align:left;"> 2021-12-14 07:58:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I got 473 SPY Calls 17th &amp;amp; 27th,  TSLA 980 DEC 17 calls for a swing. 🤷‍♂️🍺

Either a write off or donation, and If Calls Print I will 2x my donations this year.   

Donations 

https://give.helpsalvationarmy.org/give/166081/?gclid=CjwKCAiA-9uNBhBTEiwAN3IlNAa4CSGRosYdmHlhohS4n9Z8c9mdX_PLM7NYggYnbcbGwW8YnzER4hoCyNgQAvD_BwE#!/donation/checkout?utm_source=google_lerma&amp;amp;utm_medium=cpc&amp;amp;utm_term=disaster&amp;amp;utm_content=text&amp;amp;utm_campaign=edonation_national_brand&amp;amp;pid=cpc:edonation_national_brand::google_lerma:::::southern_southern:disaster:disaster </td>
   <td style="text-align:left;"> 2021-12-14 07:58:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $ETC.X $SOS $DOGE.X $BTC.X $TSLA 
when i start trading at first week i lost $350 i cry for 3 days continually than i said ok let&amp;#39;s start again &amp;#39; next week I bought a stock and i lost $2500 on that stock but i just cry for 1 day , but again I didn&amp;#39;t stop trading I bought 4 stocks covid 19 crash came and i lost almost $25K this time i just cry for one hour , one of my friend told me stock market is not good buy some crypto i start buying crypto at 2021 now I&amp;#39;m down $45K and I&amp;#39;m not crying anymore . 
All my net worth is $25K now it was $100K in 2019 . 
Share your experience. </td>
   <td style="text-align:left;"> 2021-12-14 07:57:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AAPL $TSLA anybody here work in Algo trading? If so… Are you willing to drop a hint on when the algos will stop selling lol </td>
   <td style="text-align:left;"> 2021-12-14 07:56:32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA imagine all the cyber trucks being sold when they finally release, going to be epic! Should see a $2000 stock soon! </td>
   <td style="text-align:left;"> 2021-12-14 07:56:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA is going down.

https://www.google.com/amp/s/www.barrons.com/amp/articles/mercedes-self-driving-car-51639093613 </td>
   <td style="text-align:left;"> 2021-12-14 07:56:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA When Mr. Market is confused &amp;amp; is selling off, consider it as discount &amp;amp; not panic. Use this time to buy Xceptional business. When common sense comes back, you will be rewarded. Long-term bullish on Tesla - https://youtu.be/FJXu5HAxZ58 </td>
   <td style="text-align:left;"> 2021-12-14 07:56:07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA see you at 858.00 </td>
   <td style="text-align:left;"> 2021-12-14 07:56:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA  it&amp;#39;s defo bearish.... A big hairy bear... Chaikin money flow dipped to zero. </td>
   <td style="text-align:left;"> 2021-12-14 07:55:53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA   FourDoorsMoreFormFours </td>
   <td style="text-align:left;"> 2021-12-14 07:55:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA if my math is correct that of i learned in the streets, Tesla is hitting 890 this weeks </td>
   <td style="text-align:left;"> 2021-12-14 07:55:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA hahaha amazing way to dump shares ask your crowd rather then you be liable for a stock drop lol. He has good sound counsel around him </td>
   <td style="text-align:left;"> 2021-12-14 07:54:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA down 24% from high, thinkin maybe another 10% before significant bounce </td>
   <td style="text-align:left;"> 2021-12-14 07:54:26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Simulated 975.0 dollar CALLS for Tuesday&amp;#39;s open on StockOrbit.
 https://apps.apple.com/us/app/stockorbit/id1541560646 </td>
   <td style="text-align:left;"> 2021-12-14 07:53:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Damn.  Looks like Santa Claus not coming this year.  Elon has been naughty 🤣😅😂😆🤑😀💲💰💲💰 </td>
   <td style="text-align:left;"> 2021-12-14 07:53:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY Retail Sell All, buy back lower 15% $AAPL $TSLA $AMD </td>
   <td style="text-align:left;"> 2021-12-14 07:52:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Tesla Fanboys about to receive a face rip. </td>
   <td style="text-align:left;"> 2021-12-14 07:51:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Post Vax Covid is a new disease not to be mistaken with covid-19 </td>
   <td style="text-align:left;"> 2021-12-14 07:50:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA some fuckery is expected because opex. Monthly. Odds are it’s bounce sometime Tuesday/Wednesday after fed. </td>
   <td style="text-align:left;"> 2021-12-14 07:50:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 

Period: 39 days 
Vol: 716 874M shares 
Change : -$289.84 (-23.29%)
Short volume: ~153B 
Trading days : 26
Current sentiment: Bearish - CEO selling stock don’t  buy until he’s done (YouTubers, agent@garyblack00) 

Facts ! 
- S&amp;amp;P Funds are at a very dangerous level and risk of audit in few days (shares shorted or being lent to short HFs Network) - Balancing 
-2 factories permits are due anytime now literally 
-Semi limited delivery anytime this month - literally 
- @elonmusk is about to burn these shorts really bad.  0.02
-4680 battery cells BREAKING NEWS! (Ramping)
-Q4 incredible !BLOWOUT ! 

Did I miss something?! I’m a buyer at any DIP (I show it everyday) 
🙏🏻🐉🦅 </td>
   <td style="text-align:left;"> 2021-12-14 07:50:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $GGPI $LCID $TSLA $RIVN 

Can the Polestar 3 be car of the year for 2022 based off price performance &amp;amp; looks ?

https://www.inverse.com/innovation/polestar-3-price-release-date-range-images-pictures-electric-suv </td>
   <td style="text-align:left;"> 2021-12-14 07:48:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY $QQQ $TSLA 
https://youtu.be/xB11j91tWvw </td>
   <td style="text-align:left;"> 2021-12-14 07:48:23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $SPY $QQQ think we go lower to 900 before we reach ath 
 
needs to finish this abc correction  
 
need to see what happens wednesday  
 
opex is friday </td>
   <td style="text-align:left;"> 2021-12-14 07:47:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> I would obviously like to pay $700-800 again but if it doesn’t happen then I guess I gotta buy now $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:47:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA lmao getting excited over an AH glitch 😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:47:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA if Musk continues selling tomorrow, this should drop below $900. </td>
   <td style="text-align:left;"> 2021-12-14 07:47:22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA big push tomorrow! </td>
   <td style="text-align:left;"> 2021-12-14 07:47:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $QS $TSLA https://www.torquenews.com/15475/first-commercially-viable-solid-state-battery-quantumscape-doubling-teslas-wh-kg-ratio </td>
   <td style="text-align:left;"> 2021-12-14 07:47:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Believing in Elon, bought shares! $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:47:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 1000$ tomorrow. </td>
   <td style="text-align:left;"> 2021-12-14 07:45:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I might buy a gap down tomorrow 😉 </td>
   <td style="text-align:left;"> 2021-12-14 07:44:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA well, looks like Elon just exercised his options and picked up 54,888 shares. He will most likely unload tomorrow.  Good luck Tesla Fanboys!  Take off those breeches. </td>
   <td style="text-align:left;"> 2021-12-14 07:44:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA RH is showing no loss in AH, when it was just a few minutes ago…typo or ? </td>
   <td style="text-align:left;"> 2021-12-14 07:43:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Buy back your short positions while you still have a chance! </td>
   <td style="text-align:left;"> 2021-12-14 07:43:38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA will be back no problems </td>
   <td style="text-align:left;"> 2021-12-14 07:43:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Damn, my position got pounded again! But it is getting closer to my buy limit for a swing 👍 </td>
   <td style="text-align:left;"> 2021-12-14 07:43:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $ORCL $TSLA Larry Ellison is a legend and a 🐐 </td>
   <td style="text-align:left;"> 2021-12-14 07:43:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA when $BTC.X is up = no effect. Bitcoin is down = for sure this will be down. </td>
   <td style="text-align:left;"> 2021-12-14 07:42:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA investors turning it over to after hr crew. </td>
   <td style="text-align:left;"> 2021-12-14 07:42:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY cassius cuvee is the real poty :.) $tsla &amp;amp;hyln </td>
   <td style="text-align:left;"> 2021-12-14 07:40:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY BEARS HAVE ENDURED WEEKS OF TORMENT AT THE HANDS OF BULLS. CONGRATS TO MY FELLOW BEAR CUBS THAT MADE SOME FRESH GREEN $$$ TODAY. TAKING THE BULLS CASH FEELS VERY REWARDING $AAPL $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:40:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $ARKK the real question is- when does Cathie Wood turn her fund into a Ponzi scheme like Bernie Madoff? $SPY $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:40:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA looking like red futes any minute. watch out below </td>
   <td style="text-align:left;"> 2021-12-14 07:39:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA after a quick Google search, seems like many people fan of Tesla or not, think Tesla truck is ugly , more links like this on internet https://www.forbes.com/sites/johnkoetsier/2019/11/22/tesla-cybertruck-is-ugly-as-sin-there-i-said-it/ </td>
   <td style="text-align:left;"> 2021-12-14 07:39:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $SDOW People get ready the monster of all monsters is before us.

https://www.msn.com/en-us/money/savingandinvesting/a-near-term-pullback-then-the-third-bubble-in-100-years-is-coming-says-strategist-here-e2-80-99s-how-to-get-ready/ar-AARLiyE?ocid=BingNewsSearch </td>
   <td style="text-align:left;"> 2021-12-14 07:38:42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Wow the premarket will be interesting. 🚀🚀 line up the bears for THAT HAIRCUT.. </td>
   <td style="text-align:left;"> 2021-12-14 07:38:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Powell please say &amp;quot;Collusion&amp;quot; </td>
   <td style="text-align:left;"> 2021-12-14 07:37:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA so much doom. Watch them gap it up and we forget this whole move haha </td>
   <td style="text-align:left;"> 2021-12-14 07:36:56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA when it doesn’t bounce back to $1000 it’s going to shock a lot of people probably start a selloff </td>
   <td style="text-align:left;"> 2021-12-14 07:35:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA yeahh this is doom, time to buy $800 puts incase the marker crashes for $100 </td>
   <td style="text-align:left;"> 2021-12-14 07:35:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $DOGE.X Elon sold his $TSLA Tesla and his Doge? lets hope he is going to mara for good. 😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:34:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA to the moon 🚀🚀 </td>
   <td style="text-align:left;"> 2021-12-14 07:34:46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I am not American, but I wish you guys still had Trump. </td>
   <td style="text-align:left;"> 2021-12-14 07:34:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA fill that gap at 900. </td>
   <td style="text-align:left;"> 2021-12-14 07:33:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $GGPI $LCID $TSLA 

https://techubb.com/2021/12/13/polestar-2-review-tesla-model-3-rival-60-variety-charging-top-speed-1-4-mile-top-gear/ </td>
   <td style="text-align:left;"> 2021-12-14 07:33:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Elon totally derailed this.   Gap fill time and back to the $700’s </td>
   <td style="text-align:left;"> 2021-12-14 07:32:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA wow…just wow, we may see $750 with this rate in couple of weeks </td>
   <td style="text-align:left;"> 2021-12-14 07:32:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Top is in 🎩 💰 </td>
   <td style="text-align:left;"> 2021-12-14 07:32:06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 

Love it ! 

Everyone is bearish because what WS HFs led  to believe!!! 

The most ironic outcome is likely ..

🙏🏻🐉🦅👀
4 factories online soon ! 
$1425-$1509 </td>
   <td style="text-align:left;"> 2021-12-14 07:31:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Heeey what happened? </td>
   <td style="text-align:left;"> 2021-12-14 07:30:24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $SPY How is everything in a bubble if everything has collapsed already lol </td>
   <td style="text-align:left;"> 2021-12-14 07:30:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA the real question is. If Elon wasn’t selling would the price be where it is now? Let the bears live for now, as Elon is almost done selling, and Tesla will definitely hit another all time high. </td>
   <td style="text-align:left;"> 2021-12-14 07:29:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $DOGE.X $TSLA $SPY

https://www.benzinga.com/markets/cryptocurrency/21/12/24581270/why-elon-musk-thinks-dogecoin-is-better-for-transactions-than-bitcoin?utm_campaign=partner_feed&amp;amp;utm_source=robinhood.com&amp;amp;utm_medium=partner_feed&amp;amp;utm_content=ticker_page </td>
   <td style="text-align:left;"> 2021-12-14 07:28:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> So the kid @ns29 who bought $dwac at $175 is trolling  $NKE $tsla $roku &amp;amp; others.
I think its the glasses at night that has him mad, but great Chart! he seems good </td>
   <td style="text-align:left;"> 2021-12-14 07:27:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA mercedes first with selfdriving Cars. Tesla still only betatesting. What happened to TSLA advantage ?! 😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:27:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:27:25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA honest question, does Tesla truck actually looks like this or it&amp;#39;s just a joke? Because it&amp;#39;s really ugly &amp;amp; backward </td>
   <td style="text-align:left;"> 2021-12-14 07:26:51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA No position but lots of startup frauds can’t withstand the problems Tesla has overcome and proven to be the goat of mass producing </td>
   <td style="text-align:left;"> 2021-12-14 07:26:45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA FYI https://twitter.com/FareedZakaria/status/1470135854513459203?t=l09cPSR0o-E0psA_yOp1FA&amp;amp;s=15 </td>
   <td style="text-align:left;"> 2021-12-14 07:25:50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $RIVN Analysts def. hang their enthusiasm on the Amazon delivery fleet prospect—-I wonder if $TSLA will ever delve into that? What do you all think? </td>
   <td style="text-align:left;"> 2021-12-14 07:25:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA guy gets Time Magazine&amp;#39;s person of the year when his company is facing multiple lawsuits over racism, sexual harassment, and fraud. 🤣 We live in very strange days. </td>
   <td style="text-align:left;"> 2021-12-14 07:25:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA those who got in today will be funish tommorow. Sharks wants to keep your call premium. Hands you empty bag </td>
   <td style="text-align:left;"> 2021-12-14 07:24:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I think we should gap up $300-$500 

Tomorrow for man of the year Elan Musk 

 🧞‍♂️😎 $SPY $SPX $ES_F $QQQ  😎🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 07:24:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA There is a truth in the phenomenon known as the trader lemming effect. A large number of traders are attracted to stock because of attractive spikes in sp. As soon as a speed bump is encountered these traders run to the exit to either maintain gains or sadly stem loss. This is a normal human reaction… after all we’re not emotionless machines (yet) and we react in part with instinct. We have to basically bite the bullet and examine the big picture. I believe TESLA in the near future will exceed expectations… keep you eye on the ball… take advantage of the dips… I’ve learned that well over the last 2 years … just wish I followed my own advice to a greater degree. </td>
   <td style="text-align:left;"> 2021-12-14 07:23:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA arent most car manufacturers now making electric cars and offering even more exciting EV models in future lineups ?? Then what will make tesla 🚗 stand out in the EV crowd ?? why will anyone choose a tesla EV a year or two from now ? convince me </td>
   <td style="text-align:left;"> 2021-12-14 07:23:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:23:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:22:54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA ark is a buy also. Another extremely undervalued stock </td>
   <td style="text-align:left;"> 2021-12-14 07:22:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 07:22:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA where’s all the back to 1200 dildos? </td>
   <td style="text-align:left;"> 2021-12-14 07:22:03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> If QE ends and rates go up I want to own $WFC and $WMT. Banks only asset class to outperform in a rate increases market and Wal mart hedges the event we go into a recession. I wouldn’t want to own $TSLA $NVDA or $AAPL as growth doesn’t do well in high rate environment. You’re better off flipping to value and protective asset classes. My 2 cents. </td>
   <td style="text-align:left;"> 2021-12-14 07:21:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA tesla pe ratio 1200 ,people are smoking ganja to trade this stock </td>
   <td style="text-align:left;"> 2021-12-14 07:21:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Is this bc of prez biden </td>
   <td style="text-align:left;"> 2021-12-14 07:21:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA bud </td>
   <td style="text-align:left;"> 2021-12-14 07:21:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Bump back to 1000+ tmrw... </td>
   <td style="text-align:left;"> 2021-12-14 07:21:05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA this going to 1$ </td>
   <td style="text-align:left;"> 2021-12-14 07:20:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA come un run you stupid stock </td>
   <td style="text-align:left;"> 2021-12-14 07:20:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA gap down </td>
   <td style="text-align:left;"> 2021-12-14 07:19:57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA q </td>
   <td style="text-align:left;"> 2021-12-14 07:19:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA tomorrow $800 then $500 </td>
   <td style="text-align:left;"> 2021-12-14 07:19:39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I would be scared if I were a bull. We broke the 50 day SMA...last time it did that it swiftly fell to the 200SMA....that&amp;#39;s @$756. 

I doubt it gets there this week but at very least it will be filling that $910 gap.. </td>
   <td style="text-align:left;"> 2021-12-14 07:19:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Gary Black tweeting he sold before forms even out 😂😂😂 </td>
   <td style="text-align:left;"> 2021-12-14 07:19:11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Thumbs down 👎 </td>
   <td style="text-align:left;"> 2021-12-14 07:18:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA apple electric car is coming very soon ,tsla will become penny stocks </td>
   <td style="text-align:left;"> 2021-12-14 07:18:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA fear and sell all you want fools. this will be all green tomorrow!!! mark it.. </td>
   <td style="text-align:left;"> 2021-12-14 07:17:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA https://www.tesmanian.com/blogs/tesmanian-blog/tesla-giga-shanghai-may-deliver-about-500-000-cars-in-2021-confirms-companys-policy-bd </td>
   <td style="text-align:left;"> 2021-12-14 07:16:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA what elon is gonna do now, 6 million share to sell at 6 billion dollars! Musk Biggest short of them all! </td>
   <td style="text-align:left;"> 2021-12-14 07:14:47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I hate to say it… but not only for stocks… the entire world.. this may be a very cold cold summer. </td>
   <td style="text-align:left;"> 2021-12-14 07:14:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA dead man walking 😬😬 </td>
   <td style="text-align:left;"> 2021-12-14 07:14:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $GME $AMC $TSLA  $OSTK it&amp;#39;s like the reckoning is all going to happen in December </td>
   <td style="text-align:left;"> 2021-12-14 07:14:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> VIDEO: Broad Market Technical Analysis Chart 12/13/2021 $SPY $XLF $QQQ $TSLA $AAPL https://www.chartguys.com/daily-market-videos/4045/bears-out-in-full-force </td>
   <td style="text-align:left;"> 2021-12-14 07:13:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA We still have that hearing on Thursday for New York to purchase $12 million of Tesla vehicles </td>
   <td style="text-align:left;"> 2021-12-14 07:12:37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA How does model X compete with a Kia Telluride ?? I am debating which one to buy, which one offers more luxury and comfort ?? Kia or Tesla 🚘 ?? 🚗 </td>
   <td style="text-align:left;"> 2021-12-14 07:12:21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA nothing to see here it’s down it’ll go back up </td>
   <td style="text-align:left;"> 2021-12-14 07:12:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA TSLA 2021-12-13 Daily Forecast Video: 
https://www.youtube.com/watch?v=QUrFPcGjmz8 </td>
   <td style="text-align:left;"> 2021-12-14 07:11:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA can we get a decent news that drop -100pt ? I need to btfd </td>
   <td style="text-align:left;"> 2021-12-14 07:11:30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA damn!  And here I thought only gme and AMC were getting beat like step children.

Hang in there fcukers.  Tesla doesnt stay down for long

AMC Ape </td>
   <td style="text-align:left;"> 2021-12-14 07:11:27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I’ve noticed when these “wicks” extend to an extreme level significantly outside of the trading range of that particular day, it is a VERY strong indicator that we visit that price in the following days. So I would bet that we see a $910 gap fill as early as tomorrow, and no later than Friday </td>
   <td style="text-align:left;"> 2021-12-14 07:11:02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $900 tomorrow? </td>
   <td style="text-align:left;"> 2021-12-14 07:10:10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA seesh the drop down </td>
   <td style="text-align:left;"> 2021-12-14 07:08:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $BTC.X $TSLA Just thought I’d let y’all know Tesla closed down 5% and Powell was notified because of this $spy there will be no taper brah </td>
   <td style="text-align:left;"> 2021-12-14 07:08:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA chart perfectly resembles moderna </td>
   <td style="text-align:left;"> 2021-12-14 07:06:59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA bullish at $300 🤡 </td>
   <td style="text-align:left;"> 2021-12-14 07:06:28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Steady social media sentiment for $TSLA over the past week. 7 day avg score of -17.

https://socialsentiment.io/stocks/symbol/TSLA/ </td>
   <td style="text-align:left;"> 2021-12-14 07:05:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA BULLISH ALL THE WAY TO $1200+ ✅🔥 </td>
   <td style="text-align:left;"> 2021-12-14 07:05:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY $AMC $tsla $BTC.X 

Fun fact.  During the tulip craze, the &amp;quot;best&amp;quot; tulips were selling for $175,000 -- IN TODAY&amp;#39;S MONEY...

People were paying $175k for a fucking flower!  

And yet -- today -- we have people paying similar ridiculous valuations for a car company that wouldn&amp;#39;t justify current valuation if it sold a TSLA to every man/woman/child in the world; a &amp;quot;currency&amp;quot; that will go to ZERO once governments around the globe step in and DISPLACE bitcoin with their own virtual currencies (and regulations), and a movie theater firm that is literally about to file bankruptcy!  

Lmao...  🤡🌷🤡🌷🤡🌷🤡🌷🤡🌷🤡🌷🤡🌷🤡 </td>
   <td style="text-align:left;"> 2021-12-14 07:04:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA even the best technology companies take haircuts facing these  conditions. </td>
   <td style="text-align:left;"> 2021-12-14 07:04:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY market-wide stock overvaluation combined with omicron variant about to run rampant.. not to mention a plethora of other risks incl. inflation, supply chains /shortages, international contagion effects (China), the list goes on. How anyone can be bullish in this market is mind boggling to me. $MSFT $GOOG $AAPL $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:04:40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> An expectation for an increase in rates have historically been good for bank stocks like $WFC and $JPM. But not for growth like $NVDA $TSLA and $AAPL. </td>
   <td style="text-align:left;"> 2021-12-14 07:04:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> Incoming  ... Asia and EU kicking th shit out of this overpriced p o s then comes Fraud St USA  ... https://finance.yahoo.com/quote/TSLA?p=TSLA  $TSLA $SPY $QQQ $SPX $NDX </td>
   <td style="text-align:left;"> 2021-12-14 07:04:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA bulls relax that you will be able to add it a $850 😌 </td>
   <td style="text-align:left;"> 2021-12-14 07:04:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AMC $GME $TSLA hold the line </td>
   <td style="text-align:left;"> 2021-12-14 07:03:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AMC Down almost 20% today. I want to thank all you dumb apes for so much entertainment. It&amp;#39;s mind-boggling that total idiots like you actually exist. $GME $SPY $TSLA </td>
   <td style="text-align:left;"> 2021-12-14 07:03:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA every time this just drops 5-6% when market is red who can handle these crazy swings for a stock in the S&amp;amp;P? =( </td>
   <td style="text-align:left;"> 2021-12-14 07:02:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Damn.  Crashing AH.  Looking real bad for tomorrow.  Some big whales are unloading. </td>
   <td style="text-align:left;"> 2021-12-14 07:02:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA  Might see a nice little bounce tomorrow. </td>
   <td style="text-align:left;"> 2021-12-14 07:01:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA outperforms 90% of all stocks! https://www.chartmill.com/stock/analyzer/stock/TSLA?key=b3fb89e7-ce52-4df4-906a-b4ccaf80eec8&amp;amp;utm_source=stocktwits&amp;amp;utm_medium=TA&amp;amp;utm_content=TSLA&amp;amp;utm_campaign=social_tracking </td>
   <td style="text-align:left;"> 2021-12-14 07:01:00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Still a $200 stock fool </td>
   <td style="text-align:left;"> 2021-12-14 07:00:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $1,200 was a gift from the gods and if you didn’t sell then you are a dummy </td>
   <td style="text-align:left;"> 2021-12-14 06:59:58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA  is there any other &amp;quot;Person of the year&amp;quot; type award ?? Giving it will  bring stock down to 800? </td>
   <td style="text-align:left;"> 2021-12-14 06:59:43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA https://www.businessinsider.com/elon-musk-person-of-year-elizabeth-warren-freeloading-taxes-2021-12?amp </td>
   <td style="text-align:left;"> 2021-12-14 06:59:36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA expect this to be green tomorrow. Might be bigly green. Big $$$ giving bears hope then will make them cry in the end.  You know, like same old story over the years. </td>
   <td style="text-align:left;"> 2021-12-14 06:59:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $SPY it’s the end of the world as we know it. Money will not do you much good. hope you survive. Things are not looking good $BTC  $TSLA  
and elecric cars suck butt </td>
   <td style="text-align:left;"> 2021-12-14 06:59:09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Tesla 6 month chart is your guide now.  The easy hike up is over. 
 New kind of hike soon to emerge. </td>
   <td style="text-align:left;"> 2021-12-14 06:58:49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $tsla mnuchin open to Biden BBb 🚀 </td>
   <td style="text-align:left;"> 2021-12-14 06:58:41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA damn there ppl still in gme and amc saying going 100k holy shit ppl are so lost </td>
   <td style="text-align:left;"> 2021-12-14 06:58:33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $910 or $1200 tomorrow? </td>
   <td style="text-align:left;"> 2021-12-14 06:58:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA How can you be Bearish after this pull back.. LMAO IT&amp;#39;S BUY TIME..drop the Hammer.. </td>
   <td style="text-align:left;"> 2021-12-14 06:58:19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA fear not ... You will have no impact on the great and mighty $SPY </td>
   <td style="text-align:left;"> 2021-12-14 06:57:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA $AAPL $NVDA $MSFT $GOOGL 
Ain’t doing buying til the 16th….
A lot of ….. </td>
   <td style="text-align:left;"> 2021-12-14 06:57:16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA wait every 3 month Tsla will make your money back </td>
   <td style="text-align:left;"> 2021-12-14 06:57:14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA AFTER IT HITS $1100 ✅🔥😂😂 </td>
   <td style="text-align:left;"> 2021-12-14 06:57:12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Musk was relying on naive retail &amp;amp; small investors to sell 17 million over 1k, but he&amp;#39;s still have 6 million &amp;amp; all analyst pumps &amp;amp; his Giga this &amp;amp; gig that didn&amp;#39;t work pumping it back up. Poor guy earned 110 billion dollars this year from Tesla pump! Almost needs handouts becaus he doesn&amp;#39;t have a salary,  probably git tax credit for low income too ... </td>
   <td style="text-align:left;"> 2021-12-14 06:56:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA ok.. so why cant it drop below 950? </td>
   <td style="text-align:left;"> 2021-12-14 06:56:48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA it didn’t even make new low relax bulltard </td>
   <td style="text-align:left;"> 2021-12-14 06:56:31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I see this opening above $1000 tomorrow, for some reason </td>
   <td style="text-align:left;"> 2021-12-14 06:56:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Doesn&amp;#39;t he sell usually on Tuesdays? </td>
   <td style="text-align:left;"> 2021-12-14 06:56:18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Might be a good time to 
short. We’re at the tail end of a decent little bear flag </td>
   <td style="text-align:left;"> 2021-12-14 06:56:17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA This was a  Savage pull back , I&amp;#39;m ready for a Rick Flare come back </td>
   <td style="text-align:left;"> 2021-12-14 06:56:15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA simply a daytrade stock at these prices. You&amp;#39;d be crazy to enter here at this valuation with markets near all time Highs. Way more downside than upside </td>
   <td style="text-align:left;"> 2021-12-14 06:56:08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I’m back 🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 06:56:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA do we see a -100 point down day soon?… </td>
   <td style="text-align:left;"> 2021-12-14 06:56:04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Damn why such a huge drop Ah ? </td>
   <td style="text-align:left;"> 2021-12-14 06:55:52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA Musk was relying on naive retail &amp;amp; small investors to sell 17 million over 1k, but he&amp;#39;s still have 6 million &amp;amp; all analyst pumps &amp;amp; his Giga this &amp;amp; gig that didn&amp;#39;t work pumping UT back up. Poor guy earned 110 billion dollars this year from Tesla pump! Almost needs handouts becaus ege doesn&amp;#39;t have a salary ... </td>
   <td style="text-align:left;"> 2021-12-14 06:55:34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA 1000+ open tomorrow </td>
   <td style="text-align:left;"> 2021-12-14 06:55:13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA For the man of the year $10,000

🧞‍♂️😎🍻 $SPY $SPX $DIA $DJIA  😎💲🧞‍♂️ </td>
   <td style="text-align:left;"> 2021-12-14 06:54:55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA I wonder how much elon sold today </td>
   <td style="text-align:left;"> 2021-12-14 06:54:44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $TSLA news after hours? </td>
   <td style="text-align:left;"> 2021-12-14 06:54:29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TSLA </td>
   <td style="text-align:left;"> $AMZN $TSLA Jeff Bezos was named Time’s ‘Person of the Year’ in 1999 and the stock lost nearly 50% of its value. Elon Musk has been named Time’s ‘Person of the Year’ in 2021.

Is the top in for Tesla? </td>
   <td style="text-align:left;"> 2021-12-14 06:54:25 </td>
  </tr>
</tbody>
</table></div>

