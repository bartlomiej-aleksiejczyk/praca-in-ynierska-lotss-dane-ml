options(max.print=1000000000)

options(digits=22)

ra=Y[["col"]][[2]]
dec=Y[["col"]][[4]]
pflux=Y[["col"]][[6]]
tflux=Y[["col"]][[8]]
print(min(ra))
print(max(ra))
print(min(dec))
print(max(dec))
print(min(pflux))
print(max(pflux))
print(min(tflux))
print(max(tflux))
pflux_smple = pflux[sample(nrow(df), 10000), ]
tflux_smple = tflux[sample(nrow(df), 10000), ]
hist(dec,
     breaks=(150),
     main="Histogram deklinacji",
     xlab="Pozycja wyrażona w stopniach",
     ylab="gęstość",
     xlim=c(10,79),
     ylim=c(0,(0.035)),
     xaxp = c(10, 75, 13),
     col=(4),
     freq=FALSE,
    )
hist(ra,
     breaks=(130),
     main="Histogram rektascensji",
     xlab="Pozycja wyrażona w stopniach",
     ylab="gęstość",
     xlim=c(0,370),
     ylim=c(0,(0.01)),
     col=(4),
     xaxp = c(0, 370, 37),
     yaxp = c(0, (0.008), 37),
     freq=FALSE,
)
hist(pflux_smple,
     breaks=(1300000),
     main="Histogram peak flux",
     xlab="Natężenia strumienia radiowego wyrażone w mJy",
     ylab="gęstość",
     xlim=c(0,0.1),
     ylim=c(0,(0.1)),
     col=(4),
     freq=FALSE,
)
hist(tflux_smple,
     breaks=(1300000),
     main="Histogram total flux",
     xlab="Natężenia strumienia radiowego wyrażone w mJy",
     ylab="gęstość",
     xlim=c(0,0.1),
     ylim=c(0,(1.1)),
     col=(4),
     freq=TRUE,
)
mat <- cbind(ra, dec)
mat
c=image(mat, useRaster=TRUE, axes=FALSE,col = grey(seq(0, 1, length = 256)))
save.c()
png(file="histogram1.jpeg")
c
dev.off()
mat <- matrix(c(1,1,1,0,0,0,1,0,1), nrow=3, byrow=TRUE)
rotate <- function(x) t(apply(x, 2, rev))
mat
image(rotate(mat),col = hcl.colors(12, "YlOrRd", rev = TRUE))
image(mat)
macierz = matrix(0,nrow = 3, ncol = 3)
macierz
#Przygotowanie danych, o co chodzi z signif
dec_rnd=digits = (round(dec, digits = 1))*10
ra_rnd = (round(ra, digits = 1))*10
mat <- cbind(dec_rnd, ra_rnd)
#funkcja zasadnicza z racji że indeksowanie jest od zera dodaje +1 do pozycji
data_to_matrix <- function(data) {
  output = matrix(0,nrow = 751, ncol = 3601)
  x =  nrow(data)
  for (row in 1:nrow(data)){
    output[data[row,1]+1,data[row,2]+1]=1
  }
  return(output)
} 
output= data_to_matrix(mat)
output
c = image(rotate(output), useRaster=(TRUE))
tmpF <- tempfile(fileext=".png")
#Save boats image
save.image(image(rotate(output)),tmpF)

#Dzielenie macierzy
big= output[,760:3000]
image(rotate(big), useRaster=(TRUE))
smalloutput1<-output[,1:760]
smalloutput2<-output[,3000:3610]
small<-(cbind(smalloutput1,smalloutput2) )
#x <- small[,ncol(small):1 ]
matrix_rev <- function(data) {
  output <- apply(data, 2, rev)
  return(output)
} 
vertical_finder <- function(data) {
  for (row in 1:nrow(data)){
    output[data[row,1]+1,data[row,2]+1]=1
    if (1 %in% data[row,]){
      print(row)
    }
  }
} 
horizontal_finder <- function(data) {
  for (column in 1:ncol(data)){
    if (1 %in% data[,column]){
      print(column)
    }
  }
} 
vertical_finder(big)
horizontal_finder(output)
x=matrix_rev(small)
image((rotate(small)))

