
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)

close_neightbours_met_one <- vector("character",len_lotss)
closest_neightbour_id_met_one<- vector("character",len_lotss)
closest_neightbour_ra_met_one<- vector("numeric",len_lotss)
closest_neightbour_dist_met_one<- vector("numeric",len_lotss)
closest_neightbour_dec_met_one<- vector("numeric",len_lotss)
test <- vector("numeric",nrow(gaia_all_fixed_px))
index<-0
for (lotss_num in(1:len_lotss))
{
  ra_lotss=(gaia_converted_cords_lotss_method_1[c(which(lotss_mosaic_id==appended_dates_df[lotss_num,"mosaic_id"])),"lotss_ra"])
  dec_lotss=(gaia_converted_cords_lotss_method_1[c(which(lotss_mosaic_id==appended_dates_df[lotss_num,"mosaic_id"])),"lotss_dec"])
  lotss_obj_ra=appended_dates_df[lotss_num,"ra"]
  lotss_obj_dec=appended_dates_df[lotss_num,"dec"]
  lotss_dist <- sqrt((((((ra_lotss-lotss_obj_ra)*cos(((dec_lotss*(pi))/180)))^2)+(dec_lotss-lots_obj_dec)^2)))
  index=c(which.min(lotss_dist))
  if(length(lotss_dist)>0)
    {closest_neightbour_dist_met_one[lotss_num] <- lotss_dist}
  if(length(index)>0)
  {
    closest_neightbour_id[lotss_num] <- gaia_all_fixed_px[index,"source_id"]
    closest_neightbour_ra[lotss_num] <- gaia_all_fixed_px[index,"ra"]
    closest_neightbour_dec[lotss_num] <- gaia_all_fixed_px[index,"dec"]
  }
}
met_one_lotss_neightbours <- cbind(appended_dates_df,closest_neightbour_id,closest_neightbour_ra,closest_neightbour_dec, closest_neightbour_dist_met_one)
   
