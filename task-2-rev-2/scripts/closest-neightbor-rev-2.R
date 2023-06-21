

#Tworzy puste kolumny na rezultaty
closest_neightbour_id<- vector("numeric",len_lotss)
closest_neightbour_ra<- vector("numeric",len_lotss)
closest_neightbour_dec<- vector("numeric",len_lotss)
gaia_converted_ra<- vector("numeric",len_lotss)
gaia_converted_dec<- vector("numeric",len_lotss)
closest_neightbour_dist_sec<- vector("numeric",len_lotss)
lotss_date <- vector("numeric",nrow(gaia_all_fixed_px))
test <- vector("numeric",nrow(gaia_all_fixed_px))
index<-0
#główna pętla w formie funkcji
library("Rcpp")
#zmienne pomocnicze do pętli
len_lotss <- nrow(appended_dates_df)
len_gaia <- nrow(gaia_all_fixed_px)
#Zmienne testowe
test_rcpp_1<- vector("numeric",len_lotss)
cppFunction(plugins=c("cpp11"), 'void main_loop (DataFrame appended_dates_df, DataFrame gaia_all_fixed_px, NumericVector closest_neightbour_id, NumericVector closest_neightbour_ra, NumericVector closest_neightbour_dec, NumericVector gaia_converted_ra, NumericVector gaia_converted_dec, NumericVector closest_neightbour_dist_sec) {
  auto date_lotss = [] (NumericVector a, int b, NumericVector c) {
    NumericVector result = ((a+((b-2016)*(c/1000))/3600));
    return result;
  };
  auto which_min = [] (NumericVector vector, int size) 
  {
    float min = 5454545564555;
    int min_index = -1;
    for (int i = 0; i < size; ++i) 
    {
      if (min > vector[i])
      {
        min = vector[i];
        min_index = i;
      }
    }
    
    return min_index;
  };
  float len_lotss = (appended_dates_df).nrow();
  float len_gaia = (gaia_all_fixed_px).nrow();
  int index = 0;
  NumericVector gaia_ra (len_gaia);
  NumericVector gaia_dec (len_gaia);
  float lotss_obj_ra;
  float lots_obj_dec;
  NumericVector lotss_ra_all = (appended_dates_df["ra"]);
  NumericVector lotss_dec_all = (appended_dates_df["dec"]);
  NumericVector gaia_ra_all = (gaia_all_fixed_px["ra"]);
  NumericVector gaia_dec_all = (gaia_all_fixed_px["dec"]);
  NumericVector gaia_source_all = (gaia_all_fixed_px["source_id"]);
  NumericVector source_date_all = gaia_all_fixed_px["source_id"];
  float lotss_date;
  NumericVector ra_gaia_to_lotss (len_gaia);
  NumericVector dec_gaia_to_lotss (len_gaia);
  NumericVector lotss_dist (len_gaia);
  for (int i = 0; i < 10000; i++) {
    lotss_obj_ra=(lotss_ra_all[i]);
    lots_obj_dec=(lotss_dec_all[i]);
    gaia_ra = gaia_ra_all[i];
    gaia_dec = gaia_dec_all[i];
    lotss_date = source_date_all[i];
    ra_gaia_to_lotss = date_lotss(gaia_all_fixed_px["ra"], lotss_date, gaia_all_fixed_px["pmra"]);
    dec_gaia_to_lotss = date_lotss(gaia_all_fixed_px["dec"], lotss_date, gaia_all_fixed_px["pmdec"]);
    lotss_dist = sqrt(((pow(((ra_gaia_to_lotss-lotss_obj_ra)*cos(((dec_gaia_to_lotss*(3.14159265359))/180))), 2)+pow((dec_gaia_to_lotss-lots_obj_dec), 2))));
    index = which_min(lotss_dist, len_gaia);
    if (index>=0)
      {
        closest_neightbour_id[i] = gaia_source_all[index];
        closest_neightbour_ra[i] = gaia_ra_all[index];
        gaia_converted_ra[i] = ra_gaia_to_lotss[index];
        closest_neightbour_dec[i] = gaia_dec_all[index];
        gaia_converted_dec[i] = dec_gaia_to_lotss[index];
        closest_neightbour_dist_sec[i] = lotss_dist[index]*3600;
      };
  };
}')
main_loop(appended_dates_df, gaia_all_fixed_px, closest_neightbour_id, closest_neightbour_ra, closest_neightbour_dec, gaia_converted_ra, gaia_converted_dec, closest_neightbour_dist_sec)
#lotss_neightbour_results_nearest <- cbind(appended_dates_df,closest_neightbour_id,closest_neightbour_ra,closest_neightbour_dec,closest_neightbour_dist_sec)
closest_neightbour_id
