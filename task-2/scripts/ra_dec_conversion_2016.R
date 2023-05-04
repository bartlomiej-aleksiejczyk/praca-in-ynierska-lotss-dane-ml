ra=Y[["col"]][[2]]
dec=Y[["col"]][[4]]

pmra=(appended_dates_df[["RA_DATES"]])
pmdec=(appended_dates_df[["DEC_DATES"]])

date=(appended_dates_df[["FINAL_DATETIME_DATES"]])
print(date)

output_ra <- vector("numeric",length(ra))
output_dec <- vector("numeric",length(ra))

for (numer in  (1:length(output_ra) )){
  output_ra[numer] <- ra[numer]#+((2016.0+date[numer])*(pmra[numer]))
  output_dec[numer] <-dec[numer]#+((2016.0+date[numer])*(pmdec[numer]))
  }
y_date_2016 <- cbind(appended_dates_df, output_ra)
y_date_2016 <- cbind(y_date_2016, output_dec)
