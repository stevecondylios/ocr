
# Original question
# https://stackoverflow.com/questions/60134698/extracting-underlying-data-via-rselenium-with-embedded-leaflet-svg-and-more

library(RSelenium)
rs <- rsDriver()
remote <- rs$client
remote$navigate("https://www.facebook.com/ads/library/?active_status=all&ad_type=political_and_issue_ads&country=US&impression_search_field=has_impressions_lifetime&q=actblue&view_all_page_id=38471053686")
remote$navigate("https://www.reddit.com/r/Rlanguage/comments/cjotjs/rselenium_error_in_checkerrorres_undefined_error/") 


library(netstat)
remote <- rsDriver(browser=c("chrome"), chromever=chromedriver_version(), verbose = TRUE, port=free_port())
remote <- remote$client
remote$navigate("https://www.facebook.com/ads/library/?active_status=all&ad_type=political_and_issue_ads&country=US&impression_search_field=has_impressions_lifetime&q=actblue&view_all_page_id=38471053686")

remote$screenshot()


test <- remote$findElement(using = "xpath", "//*[@class=\"_7kfh\"]")
test$clickElement()

screenshot <- remote$screenshot()

# plot.new()
display_image(screenshot)



## Manually figured out element
test <- remote$findElement(using = "xpath", "//*[@class=\"_7lq0\"]")
test$getElementText()



library(httr)

url <- "https://www.facebook.com/ads/library/async/insights/?ad_archive_id=500762440823362&country=US&session_id=1c89abb4-60cd-4a43-918b-7c189cfc566d"

body <- "__user=145234254&__a=1&__dyn=7xeUmBwjbgydwn8K4osBWo5O12wAxu13wqojyUW3qi2K7E2gzEeUhwVwgU3ex60Vo1upE4W0OE2WxO0SobEa8465o-cw5MKi8wl8G0jx0Fwwx-2y0iq58W4UtwKwrUuwl81e-&__csr=&__req=a&__beoa=0&__pc=PHASED%3ADEFAULT&dpr=2&__rev=1001742001&__s=h3nj1h%3A4afaaf%3Asnt767&__hsi=34543543534545-0&__comet_req=0&fb_dtsg=AQGiKH5I3flB%3AAQGbjl1d5aJz&jazoest=22004&__spin_r=1001742001&__spin_b=trunk&__spin_t=43434345667"

user_agent <- "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36"

httr::POST(url = url, body = body, add_headers("user-agent" = user_agent))

httr::POST(url = url, body = body)



rm(list=ls()); gc() # deleting the remDr object and gc() is an easy way to stop the server and free up the port
library(RSelenium)
rD <- rsDriver(browser=c("chrome"), chromever="73.0.3683.68", verbose = TRUE, port=4444L)
rD <- rsDriver(browser=c("chrome"), chromever=chromedriver_version(), verbose = TRUE, port=free_port())
remDr <- rD$client
some_url <- "https://news.ycombinator.com/item?id=21802952"
remDr$navigate(some_url) %>% remDr$getPageSource() %>% .[[1]] %>% .[1] %>% read_html(.)


chromedriver_version()
chrome_version()




