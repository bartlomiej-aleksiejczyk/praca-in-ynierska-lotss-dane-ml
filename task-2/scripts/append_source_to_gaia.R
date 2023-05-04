distance <- function(a, b,c,d)
{ 

  x=cbind(a,b)
  y=cbind(c,d)
  return(sqrt(((a-c)^2)*(cos((b*pi)/180))+(b-d)^2))
}

#aux_dist=apply
#[which(aux_dist == min(aux_dist, na.rm = TRUE))]
len<-as.numeric(nrow(Konwersja_data_3))
lotss_date <- vector("numeric",nrow(gaia_all_fixed_px))
lotss_mosaic_id <- vector("character",nrow(gaia_all_fixed_px))

for (gaia_num in 1:nrow(gaia_all_fixed_px)){
  ra_gaia=rep(gaia_all_fixed_px[gaia_num,2],len)
  dec_gaia=rep(gaia_all_fixed_px[gaia_num,3],len)
  dist<-mapply(distance,Konwersja_data_3[,2],Konwersja_data_3[,3],ra_gaia,dec_gaia)
 Konwersja_data_3$dist = dist
 index=c(which(Konwersja_data_3["dist"] == min(Konwersja_data_3["dist"])))
 lotss_date[gaia_num] <- Konwersja_data_3[index,5]
 lotss_mosaic_id[gaia_num] <- Konwersja_data_3[index,1]
}

gaia_added_sources_names_lotss_method_1 <- cbind(gaia_all_fixed_px,lotss_mosaic_id,lotss_date)

#FUnkcja sprawdza czy istnieja rekordy gaia z duplikat
for (check_num in 1:length(lotss_mosaic_id)){
    if(length(output1[check_num])>1){
      print(check_num)
    }
}
#testcase
ra_gaia=rep(gaia_all_fixed_px[1,2],len)
dec_gaia=rep(gaia_all_fixed_px[1,3],len)
test_dist<-mapply(distance,Konwersja_data_3[,2],Konwersja_data_3[,3],ra_gaia,dec_gaia)
print(which.min(test_dist))
print(test_dist)


