# Update the Z-packages without touching GitHub

# Make that mosaic has previously been installed
# 
if (!require("mosaic")) install.packages("mosaic")
if (!require("ggformula")) install.packages("ggformula")
if (!require("mosaicCalc")) install.packages("mosaicCalc")
# Update by installing from this directory
install.packages(
  "http://www.mosaic-web.org/go/packages/mosaicCalc_0.5.3.tar.gz", 
  repos=NULL)
install.packages(
  "http://www.mosaic-web.org/go/packages/Zcalc_0.1.0.tar.gz", 
  repos=NULL)


