
# 2 Methods for getting data, first via RCurl and other using download.file
# library(RCurl)

# URL <- "https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD"

# x <-getURL(URL)

# out <- read.csv(textConnection(x))
# head(out[1:6])

# dim(out)

download.file("https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD",destfile="data.csv",method="libcurl")

starbucks1 <- read.csv("data.csv")

View(starbucks1)

starbucks <- starbucks1[ which(starbucks1$State=='IN' 
                         & starbucks1$Country== 'US'), ]

View(starbucks)

library("leaflet") 

leaflet() %>% addTiles() %>% setView(-85.4070, 40.2011, zoom = 10) %>% 
              
addMarkers(data = starbucks, lat = ~ Latitude, lng = ~ Longitude, popup = starbucks$Name)