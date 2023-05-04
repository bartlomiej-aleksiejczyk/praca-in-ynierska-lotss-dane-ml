mozaika=Y[["col"]][[24]]
length(mozaika) 
konwersja_nowa <- (Konwersja_data_3)
mozaika_legenda<-(konwersja_nowa[["Mozaika"]])
data_i_godzina=konwersja_nowa[["FINAL_DATETIME_DATES"]]
output1 <- vector("numeric",length(mozaika))
for (numer in  (1:length(mozaika) )){
  output1[numer] <- data_i_godzina[which(mozaika_legenda == mozaika[numer])]; output1
}

length(output1)
test<-as.data.frame(output1)

lista_do_df

Y_date <- cbind(Y, output)