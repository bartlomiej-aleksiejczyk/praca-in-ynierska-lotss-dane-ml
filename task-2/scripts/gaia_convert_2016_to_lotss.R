ra=gaia_added_sources_names_lotss_method_1["ra"]
dec=gaia_added_sources_names_lotss_method_1["dec"]

date=(appended_dates_df[["FINAL_DATETIME_DATES"]])
print(date)
#START
len_gaia=nrow(gaia_added_sources_names_lotss)

lotss_ra <- vector("numeric",len_gaia)
lotss_dec <- vector("numeric",len_gaia)

for (numer in  (1:len_gaia )){
  lotss_ra[numer] <- (gaia_added_sources_names_lotss_method_1[numer,"ra"]+((gaia_added_sources_names_lotss_method_1[numer,"lotss_date"]+2016)*(gaia_added_sources_names_lotss_method_1[numer,"pmra"]/1000)))/3600
  lotss_dec[numer] <- (gaia_added_sources_names_lotss_method_1[numer,"dec"]+((gaia_added_sources_names_lotss_method_1[numer,"lotss_date"]+2016)*(gaia_added_sources_names_lotss_method_1[numer,"pmdec"]/1000)))/3600
}
gaia_converted_cords_lotss_method_1 <- cbind(gaia_added_sources_names_lotss_method_1, lotss_ra,lotss_dec)

