for (numer in  (1:4396228 )){
  if (appended_dates_df[numer, "mosaic_id"] =='P24Hetdex20')
  {
    appended_dates_df[numer, "source_date"] <- 2018.65525
    #Source coef = flux dates
    appended_dates_df[numer, "source_coefficient"] <- 1.010 
    appended_dates_df[numer, "source_centre_ra"] <- 187.407
    appended_dates_df[numer, "source_centre_dec"] <- 45.332
 
    
  }
}

