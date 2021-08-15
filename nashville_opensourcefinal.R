install.packages("rgeos")
library(rgeos)
library(raster)
library(rgdal)
library(ggplot2)

rm(list=ls())
setwd("/Volumes/Backup/qgisfinal")

################ 1990 #####################

blue = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband1.tif")
green = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband2.tif")
red = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband3.tif")
nir = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband4.tif")
swir1 = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband5.tif")
swir2 = raster("/Volumes/Backup/qgisfinal/Landsat/1990images/clipband7.tif")


#### perform BAEI Spectral Enhancement #####
baei1990 <- (red +0.3)/(green + swir1)
plot(baei1990, xaxt='n')

### mask out forests and vegetation to isolate built-up ####
### the range is a lose estimate based on the plot above ### 
baei1990[baei1990<.22] <- NA
baei1990[baei1990>0.44]<- NA
plot(baei1990,
     main="BAEI 1990")

### plot raster on top of imagery (optional) ####

stack = stack(baei1990,nir,red,green)
plotRGB(stack, stretch='lin')

#### write raster to file to manipulate in QGIS ##### 
writeRaster(x = baei1990,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/1990_fullextent.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

################ 2000 #####################

blue = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband1.tif")
green = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband2.tif")
red = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband3.tif")
nir = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband4.tif")
swir1 = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband5.tif")
swir2 = raster("/Volumes/Backup/qgisfinal/Landsat/2000images/clipband7.tif")

#### perform Spectral Enhancement #####
baei2000 <- (red + 0.3)/(green + swir1)
plot(baei2000)

### mask out forests and vegetation to isolate built-up ####
### the range is a lose estimate based on the plot above - make sure to run the previous code before updating ### ### 
baei2000[baei2000<.28] <- NA
baei2000[baei2000>0.55]<- NA
plot(baei2000,
     main="BAEI 2000")

#### write raster to file to manipulate in QGIS ##### 
writeRaster(x = baei2000,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2000_fullextent.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

################ 2010 #####################

blue = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband1.tif")
green = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband2.tif")
red = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband3.tif")
nir = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband4.tif")
swir1 = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband5.tif")
swir2 = raster("/Volumes/Backup/qgisfinal/Landsat/2010images/clipband7.tif")

#### perform BAEI Spectral Enhancement #####
baei2010 <- (red + 0.3)/(green + swir1)
plot(baei2010)

### mask out forests and vegetation to isolate built-up ####
### the range is a lose estimate based on the plot above - make sure to run the previous code before updating ### ### 
baei2010[baei2010<.29] <- NA
baei2010[baei2010>0.57]<- NA
plot(baei2010,
     main="BAEI 2010")

#### write raster to file to manipulate in QGIS ##### 
writeRaster(x = baei2010,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2010_fullextent.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

################ 2020 #####################

blue = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband2.tif")
green = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband3.tif")
red = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband4.tif")
nir = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband5.tif")
swir1 = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband6.tif")
swir2 = raster("/Volumes/Backup/qgisfinal/Landsat/2020images/clipband7.tif")

#### perform BAEI Spectral Enhancement #####
baei2020 <- (red + 0.3)/(green + swir1)
plot(baei2020)

### mask out forests and vegetation to isolate built-up ####
### the range is a lose estimate based on the plot above - make sure to run the previous code before updating ### ### 
baei2020[baei2020<.35] <- NA
baei2020[baei2020>0.56]<- NA
plot(baei2020,
     main="BAEI 2020")

#### write raster to file to manipulate in QGIS ##### 
writeRaster(x = baei2020,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2020_fullextent.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

#### Calculate changes since 1990 ####

diff1990_2000 <- baei2000 - baei1990
plot(diff1990_2000)
writeRaster(x = diff1990_2000,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/1990diff.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

diff90_10 <- baei2010 - baei1990
plot(diff90_10)
writeRaster(x = diff90_10,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2010diff.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

diff90_20 <- baei2020 - baei1990
plot(diff90_20)
writeRaster(x = diff90_20,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2020diff.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

#### isolate areas with >= 0.15 increase in built-up area ####
diff1990_2000[diff1990_2000<0.15] <- NA
writeRaster(x = diff1990_2000,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2000hotspots.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)
diff90_10[diff90_10<0.15] <- NA
writeRaster(x = diff90_10,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2010hotspots.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)
plot(diff90_10)
diff90_20[diff90_20<0.15] <- NA
writeRaster(x = diff90_20,
            filename="/Volumes/Backup/qgisfinal/spectralenhancements/2020hotspots.tif",
            format = "GTiff", # save as a tif
            overwrite = TRUE)

