start_time <- Sys.time()
{
#Funkcja konwertuje datę z gai na lotss, za pomocą pmra/pmdec
date_lotss <- function(a, b,c)
{ 
  return((a+((b-2016)*(c/1000))/3600))
}
#zmienne pomocnicze do pętli
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)
#Tworzy puste kolumny na rezultaty
closest_neightbour_id<- vector("numeric",len_lotss)
closest_neightbour_ra<- vector("numeric",len_lotss)
gaia_converted_ra<- vector("numeric",len_lotss)
gaia_converted_dec<- vector("numeric",len_lotss)
closest_neightbour_dec<- vector("numeric",len_lotss)
closest_neightbour_dist_sec<- vector("numeric",len_lotss)
lotss_date <- vector("numeric",nrow(gaia_all_fixed_px))
test <- vector("numeric",nrow(gaia_all_fixed_px))
gaia_ra_all <-gaia_all_fixed_px[,"ra"]
gaia_pmra_all <-gaia_all_fixed_px[,"pmra"]
gaia_dec_all <-gaia_all_fixed_px[,"dec"]
gaia_pmdec_all <-gaia_all_fixed_px[,"pmdec"]
gaia_source_all <-gaia_all_fixed_px[,"source_id"]
lotss_ra_all <-appended_dates_df[,"ra"]
lotss_dec_all <- appended_dates_df[,"dec"]
lotss_date_all <-appended_dates_df[,"source_date"]
}
{
  for (lotss_num in(1:len_lotss))
{
    #obiekt z katalogu lotss, kolejno ra obiektu i dec obiektu
    lotss_obj_ra=lotss_ra_all[lotss_num]
    lots_obj_dec=lotss_dec_all[lotss_num]
    lotss_date=lotss_date_all[lotss_num]
    #obiekt z kataogu gaia, przekonwertowany na lotss, kolejno ra i dec
    ra_gaia_to_lotss<-date_lotss(gaia_ra_all, lotss_date, gaia_pmra_all)
    dec_gaia_to_lotss<-date_lotss(gaia_dec_all, lotss_date, gaia_pmdec_all)
    #Poniższa instrukcja oblicza dystans pomiędzy obiektem lotss i gaia
    #lista zmiennych w poniższej funkcji
    #ra_gaia_to_lotss - skorygowana, w oparciu o ruchy własne współrzędna RA gaia
    #lotss_obj_ra - współrzędna RA obiektu lotss
    #dec_gaia_to_lotss - skorygowana, w oparciu o ruchy własne współrzędna DEC gaia
    #lots_obj_dec - współrzędna DEC obiektu lotss
    #cos - funkcja cosinus (wejście w radianach)
    lotss_dist <- sqrt((((((ra_gaia_to_lotss-lotss_obj_ra)*cos(((dec_gaia_to_lotss*(pi))/180)))^2)+(dec_gaia_to_lotss-lots_obj_dec)^2)))
    index=c(which.min(lotss_dist))
    #tworzy nową kolumny, które później będą dołączone do dataframe
      closest_neightbour_id[lotss_num] <- gaia_source_all[index]
      closest_neightbour_ra[lotss_num] <- gaia_ra_all[index]
      gaia_converted_ra[lotss_num] <- ra_gaia_to_lotss[index]
      closest_neightbour_dec[lotss_num] <- gaia_dec_all[index]
      gaia_converted_dec[lotss_num] <-dec_gaia_to_lotss[index]
      closest_neightbour_dist_sec[lotss_num] <- min(lotss_dist)*3600
  }
}
end_time <- Sys.time()
end_time - start_time
closest_neightbour_id
#łączy kolumny z dataframe
lotss_neightbour_results_nearest <- cbind(appended_dates_df,closest_neightbour_id,closest_neightbour_ra,closest_neightbour_dec,closest_neightbour_dist_sec)
csv_results_nearest <- head(lotss_neightbour_results_nearest, 10000)
write.csv(csv_results_nearest,file='~/Documents/inżynierka/task-2/data/nearest_neightbours_newest_many.csv')
results_half <- cbind(appended_dates_df,closest_neightbour_id, gaia_converted_ra,gaia_converted_dec,closest_neightbour_dist_sec)
results_nearest_full_10px <- merge(x = results_half, y = gaia_selected, by = "closest_neightbour_id",all.x = TRUE)

names(gaia_selected)[names(gaia_selected) == 'source_id'] <- 'closest_neightbour_id'
write.csv(results_nearest_full_10px[sample(nrow(df), 3), ],file='nearest_neightbours_newest_1000.csv')
write.csv(appended_dates_df ,file='lotss_with_dates.csv')

