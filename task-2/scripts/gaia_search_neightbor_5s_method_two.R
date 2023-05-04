
date_lotss <- function(a, b,c)
{ 
  return((a+((b+2016)*(c/1000)))%%360)
}
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)

close_neightbours <- vector("character",len_lotss)
closest_neightbour_id<- vector("character",len_lotss)
closest_neightbour_ra<- vector("numeric",len_lotss)
closest_neightbour_dec<- vector("numeric",len_lotss)
lotss_date <- vector("numeric",nrow(gaia_all_fixed_px))
test <- vector("numeric",nrow(gaia_all_fixed_px))
index<-0
for (lotss_num in(1:len_lotss))
{
    lotss_obj_ra=rep(appended_dates_df[lotss_num,"ra"],len_gaia)
    lots_obj_dec=rep(appended_dates_df[lotss_num,"dec"],len_gaia)
    lotss_date=rep(appended_dates_df[lotss_num,"source_date"],len_gaia)
    
    ra_lotss<-mapply(date_lotss,gaia_all_fixed_px[,"ra"], lotss_date, gaia_all_fixed_px[,"pmra"])
    dec_lotss<-mapply(date_lotss,gaia_all_fixed_px[,"dec"], lotss_date, gaia_all_fixed_px[,"pmdec"])
    test_case_search<-cbind(gaia_all_fixed_px,ra_lotss)
    test_case_search<-cbind(test_case_search,dec_lotss)
    #*cos(((test_case_search[,"dec_lotss"]*(pi))/180))
    #test<-(sqrt(((((test_case_search["ra_lotss"]-lotss_obj_ra)*cos(((test_case_search[,"dec_lotss"]*(pi))/180)))^2)+(test_case_search["dec_lotss"]-lots_obj_dec)^2)))
    #test_case_search<-cbind(test,test_case_search)
    index=(which.min(unlist(sqrt(((((test_case_search["ra_lotss"]-lotss_obj_ra)*cos(((test_case_search[,"dec_lotss"]*(pi))/180)))^2)+(test_case_search["dec_lotss"]-lots_obj_dec)^2)))))
    if(length(index1)>0)
    {
      closest_neightbour_id[lotss_num] <- test_case_search[index1,"source_id"]
      closest_neightbour_ra[lotss_num] <- test_case_search[index1,"source_id"]
      closest_neightbour_dec[lotss_num] <- test_case_search[index1,"source_id"]
      
    }
}
lotss_neightbours <- cbind(appended_dates_df,closest_neightbour_id)
lotss_neightbours <- cbind(lotss_neightbours,closest_neightbour_ra)
lotss_neightbours <- cbind(lotss_neightbours,closest_neightbour_dec)

