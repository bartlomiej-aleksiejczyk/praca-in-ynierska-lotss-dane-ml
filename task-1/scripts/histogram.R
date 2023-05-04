options(max.print=1000000000)
options(digits=22)
pflux=Y[["col"]][[6]]
tflux=Y[["col"]][[8]]
#pflux_smple = pflux[sample(length(pflux), 100000)]
tflux_smple = tflux[sample(length(tflux), 400000)]
hist(log(pflux),
     breaks=(1300000),
     main="Histogram peak flux",
     xlab="log(Natężenia strumienia radiowego wyrażone w mJy)",
     ylab="gęstość",
     xlim=c(0,0.1),
     freq=FALSE,
)
hist(log(tflux),
     breaks=(1300000),
     main="Histogram total flux",
     xlab="log(Natężenia strumienia radiowego wyrażone w mJy)",
     ylab="gęstość",
     xlim=c(0,0.1),
     freq=FALSE,
)
df_pflux = as.data.frame(pflux)
df_tflux = as.data.frame(tflux)

library(ggplot2)
 ggplot(df_pflux, aes(x=pflux)) + 
   geom_histogram(aes(y = after_stat(density)),binwidth=0.01, color="black", fill="white")+
   ggtitle("Peak flux log log") +
   theme(axis.text.x = element_text(angle = 90,
                                    vjust = 0.5,
                                    hjust = 0.5)) +
   scale_x_log10(limits = c(0.02,0.1), name='Natężenie strumienia radiowego wyrażone w mJy')+
   scale_y_log10()
 
