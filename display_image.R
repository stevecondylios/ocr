


# From https://stackoverflow.com/questions/46032969/how-to-display-base64-images-in-r
library(RCurl)
getImg <- function(txt) {
  raw <- base64Decode(txt, mode="raw")
  if (all(as.raw(c(0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a))==raw[1:8])) { # it's a png...
    img <- png::readPNG(raw)
    transparent <- img[,,4] == 0
    img <- as.raster(img[,,1:3])
    img[transparent] <- NA
  } else if (all(as.raw(c(0xff, 0xd8, 0xff, 0xd9))==raw[c(1:2, length(raw)-(1:0))])) { # it's a jpeg...
    img <- jpeg::readJPEG(raw)
  } else stop("No Image!")
  return(img)
}
par(mfrow = c(1,1))
fn <- system.file("img", "Rlogo.png", package="png")
txt <- base64Encode(readBin(fn, "raw", file.info(fn)[1, "size"]), "txt")
plot(1:2, type='n')
rasterImage(getImg(txt), 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)
txt <- "/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/wAALCAAgACABAREA/8QAGAABAQEBAQAAAAAAAAAAAAAABQYDBAH/xAAjEAABBQEAAgMBAQEBAAAAAAACAQMEBQYHCBIRExQhACJB/9oACAEBAAA/ABMfwnJcK0WrucdoMdrtpQ3IQOm+VPVq49RGh6AvT2qcjUGhrY2jZChASC4X/BtkSo4yiadt3/R6/esuXXbvKuv0QwGJ05nWeR+b5bOeJ1FNHQysaHPkQWFD1JBmI2oi4Psif34e028heSoUhdBl3/VW2oci1zlq45SMdUzIVrLDkmfk9bQOHWaNYJG+8/AL6pifSBqyXqgrJdA65t+L9tY8go8+DovILx6q6zR6PQ0kT8MHyP5RYE2w1dfQKKJSo4E2y+RCotfDa/YZxWxbodE9FpbsmMTH0+Z5/wAqc0HOuXu5+PFWwoM9QJHZ0uir3iJWiv763mQ6uHLFv3bOa44vyY+y8kORouc1TtDB04U8CsfVJldkpUhioZdE1Rx1pv7BGSRKKiE2ar8+Y36yJEpP0JDhetY6Vodva2RvpX3E52JMeuiMnJVbbtSBZp57xOL9rr8KW/ElsOPKTwshIj/P45rrH+W4llarZ9s5dBbWozWH3cno+YkU0WHHYars1o+f1m0Ko9mhAVjQbCylI2Px8ChfH8+P8BxDMWuL4hyqIyFnf7nBxehZqRQR40mUsvSZroVXtXKhFbE1GXNra6UjSKnsZNin9/n+2TNP5Dn0+wSQzos3GajPPzHHxZh2FO6CBUWThGiMsMS4wMSo7j6g197kiJ7frhOsKJn7HPdmsnIUXQJfrKivJLqchOiTbFpgvkHXh+HCWIIoXqk+w/PXw1UJLkgijpCmM3s6drqD8GMh5vRdF7HH0HPeZrRQZCQr650LjA6nTwzNRfaoaeqhRKqFJ9V924JuKKB7KND0HqWP7RxVvyFYmz894/8AkHY1mh1N/n4yzp3jd1mvRtlq7/MPwYxZB+jb5KKG8htl9gJIZF2W0e2meOEOjf6HLzvLSGRJtMtcoN1Ycl0L1jIjm/Pyeqz7rdpmlnCEl1+CiuQyR1DJkPYQFvtO85kOEhrb9s8V5OXWeFnYhrPITWdgYjl6GSSGcuEaHHlviZeyDNF5PYU9kX/3pz3jzre35faaDP3OxwXP9PVJD6t5SdcghnLK5pPltFqMtTl6pXVTwkKt/AgJIf1KSKy0B//Z"
plot(1:2, type='n')
rasterImage(getImg(txt), 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)












display_image <- function(txt) {
  
  library(RCurl)
  getImg <- function(txt) {
    raw <- base64Decode(txt, mode="raw")
    if (all(as.raw(c(0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a))==raw[1:8])) { # it's a png...
      img <- png::readPNG(raw)
      transparent <- img[,,4] == 0
      img <- as.raster(img[,,1:3])
      img[transparent] <- NA
    } else if (all(as.raw(c(0xff, 0xd8, 0xff, 0xd9))==raw[c(1:2, length(raw)-(1:0))])) { # it's a jpeg...
      img <- jpeg::readJPEG(raw)
    } else stop("No Image!")
    return(img)
  }
  
  rasterImage(getImg(txt), 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)
  
}



dev.off()
