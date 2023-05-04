mozaika=Y[["col"]][[24]]
konwersja_nowa <- head(Konwersja_data, - 1)              # Apply head function
mozaika_legenda=(konwersja_nowa[["Mozaika"]])
data_i_godzina=konwersja_nowa[["Wynik data+godzina"]]
output1 <- vector("float", length(mozaika))
for (numer in  (1:length(mozaika) )){
  output1 <- append(output1, data_i_godzina[which(ozaika_legenda == mozaika[numer])])
  for (numer1 in  (1:length(konwersja_nowa[["Wynik data+godzina"]]) )){
    #print(mozaika_legenda[numer1])
    #print(data_i_godzina[numer1])
    if (mozaika[numer]==mozaika_legenda[numer1]) {
      
    }
  }
}

lista_do_df

Y_date <- cbind(Y, output)
