options(warn=1)
require(FITSio)
Y <- readFITS("dane-source-01.fits")
## Look at contents
str(Y)
Y$colNames
traceback() 
Y <- readFITS("dane-source-01.fits")
