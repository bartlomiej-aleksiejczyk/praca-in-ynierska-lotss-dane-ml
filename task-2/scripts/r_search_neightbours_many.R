#Funkcja konwertuje datę z gai na lotss
date_lotss <- function(a, b,c)
{ 
  return((a+((b-2016)*(c/1000))/3600))
}
#zmienne pomocnicze do pętli
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)
#Tworzy puste kolumny na rezultaty
closest_neightbours_id<- vector("list",len_lotss)
closest_neightbours_dist_sec<- vector("list",len_lotss)
lotss_date <- vector("numeric",nrow(gaia_all_fixed_px))
test <- vector("numeric",nrow(gaia_all_fixed_px))
index<-0
#lotss_neightbours_test_2 <- cbind(appended_dates_df,closest_neightbours_id,closest_neightbours_dist_sec)
#lotss_neightbours_tibble <- as_tibble(lotss_neightbours_test_2)
for (lotss_num in(1:len_lotss))
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
  lotss_dist <- sqrt((((((ra_gaia_to_lotss-lotss_obj_ra)*cos(((dec_gaia_to_lotss*(pi))/180)))^2)+(dec_gaia_to_lotss-lots_obj_dec)^2)))*3600
  #zgodnie z czym było powiedziane mniejsza odległość od 120 stopni czyli 120/3600
  index=c(which(lotss_dist<(120)))
  #tworzy nową kolumny, które później będą dołączone do dataframe
  if(length(index)>0)
  {
  
    closest_neightbours_id[lotss_num] <- (list((gaia_all_fixed_px[(index),"source_id"])))
    closest_neightbours_dist_sec[lotss_num] <- ((list(lotss_dist[index, 1])))
    
    #Dystans w sekundach?

  }
  #lotss_neightbour_test <- cbind(appended_dates_df,closest_neightbours_id,closest_neightbours_dist_sec)
}
#łączy kolumny z dataframe
library(tidyverse)
gaia_many_tibble <- tibble(appended_dates_df)
gaia_many_results_ids <- tibble(closest_neightbours_id)
gaia_many_results_dists <- tibble(closest_neightbours_dist_sec)
gaia_many_results_tibble <- bind_cols(gaia_many_tibble, gaia_many_results_ids,gaia_many_results_dists)
not_null_results <- filter(gaia_many_results_tibble, ((closest_neightbours_id))!="NULL")
#po przefiltrowaniu pokazuje ze  101555 jest rekordow posaidajacych co najmniej jednego sasiada bliszego niz 1/30 z czego
csv_results_many <- head(gaia_many_results_tibble, 10000)
lotss_neightbours_many_result <- cbind(appended_dates_df,closest_neightbours_id,closest_neightbours_dist_sec)
write_csv(csv_results_many,file='many_neightbours1.csv')
library(data.table)
not_null_results_10000 <- head(not_null_results, 10000)
fwrite(not_null_results_10000, file ="many_neightbours1.csv")
