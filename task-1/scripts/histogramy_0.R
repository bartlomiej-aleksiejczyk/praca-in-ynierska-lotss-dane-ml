
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
hist(pflux,
     breaks=(130000),
     main="Histogram peak flux",
     xlab="Natężenia strumienia radiowego wyrażone w mJy",
     ylab="gęstość",
     xlim=c(0,400),
     ylim=c(0,(0.001)),
     col=(4),
     freq=FALSE,
)
hist(tflux,
     breaks=(130000),
     main="Histogram total flux",
     xlab="Natężenia strumienia radiowego wyrażone w mJy",
     ylab="gęstość",
     xlim=c(0,400),
     ylim=c(0,(0.001)),
     col=(4),
     freq=FALSE,
)
mat <- cbind(ra, dec)
mat
c=image(mat, useRaster=TRUE, axes=FALSE,col = grey(seq(0, 1, length = 256)))
save.c()
png(file="histogram1.jpeg")
c
dev.off()
