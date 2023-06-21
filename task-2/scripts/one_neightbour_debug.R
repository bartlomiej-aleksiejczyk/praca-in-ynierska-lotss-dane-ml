#Funkcja konwertuje datę z gai na lotss
date_lotss <- function(a, b,c)
{ 
  return((a+((b-2016)*(c/1000))/3600))
}
#zmienne pomocnicze do pętli
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)
#Tworzy puste kolumny na rezultaty
closest_neightbour_id_debug<- vector("numeric",len_lotss)
closest_neightbour_ra_debug<- vector("numeric",len_lotss)
gaia_converted_ra_debug<- vector("numeric",len_lotss)
gaia_converted_dec_debug<- vector("numeric",len_lotss)
closest_neightbour_dec_debug<- vector("numeric",len_lotss)
closest_neightbour_dist_sec_debug<- vector("numeric",len_lotss)
lotss_date_debug <- vector("numeric",nrow(gaia_all_fixed_px))
index<-0
for (lotss_num in(3657549:len_lotss))
{
  gaia_ra <-gaia_all_fixed_px[,"ra"]
  gaia_dec <-gaia_all_fixed_px[,"dec"]
  #obiekt z katalogu lotss, kolejno ra obiektu i dec obiektu
  lotss_obj_ra=(appended_dates_df[lotss_num,"ra"])
  lots_obj_dec=(appended_dates_df[lotss_num,"dec"])
  lotss_date=(appended_dates_df[lotss_num,"source_date"])
  #obiekt z kataogu gaia, przekonwertowany na lotss, kolejno ra i dec
  ra_gaia_to_lotss<-date_lotss(gaia_all_fixed_px[,"ra"], lotss_date, gaia_all_fixed_px[,"pmra"])
  dec_gaia_to_lotss<-date_lotss(gaia_all_fixed_px[,"dec"], lotss_date, gaia_all_fixed_px[,"pmdec"])
  lotss_dist <- sqrt((((((ra_gaia_to_lotss-lotss_obj_ra)*cos(((dec_gaia_to_lotss*(pi))/180)))^2)+(dec_gaia_to_lotss-lots_obj_dec)^2)))
  index=c(which.min(lotss_dist))
  print(lotss_date)
  #tworzy nową kolumny, które później będą dołączone do dataframe
  if(length(index)>0)
  {
    
    closest_neightbour_id_debug[lotss_num] <- gaia_all_fixed_px[index,"source_id"]
    closest_neightbour_ra_debug[lotss_num] <- gaia_all_fixed_px[index,"ra"]
    gaia_converted_ra_debug[lotss_num] <- ra_gaia_to_lotss[index]
    closest_neightbour_dec_debug[lotss_num] <- gaia_all_fixed_px[index,"dec"]
    gaia_converted_dec_debug[lotss_num] <-dec_gaia_to_lotss[index]
    closest_neightbour_dist_sec_debug[lotss_num] <- min(lotss_dist)*3600
    
  }
}
#łączy kolumny z dataframe
lotss_neightbour_results_nearest_debug <- cbind(appended_dates_df,closest_neightbour_id,closest_neightbour_ra,closest_neightbour_dec,closest_neightbour_dist_sec)
csv_results_nearest <- head(lotss_neightbour_results_nearest, 10000)
write.csv(csv_results_nearest,file='~/Documents/inżynierka/task-2/data/nearest_neightbours_newest_many.csv')
results_half <- cbind(appended_dates_df,closest_neightbour_id, gaia_converted_ra,gaia_converted_dec,closest_neightbour_dist_sec)
results_nearest_full_10px <- merge(x = results_half, y = gaia_selected, by = "closest_neightbour_id",all.x = TRUE)

names(gaia_selected)[names(gaia_selected) == 'source_id'] <- 'closest_neightbour_id'

