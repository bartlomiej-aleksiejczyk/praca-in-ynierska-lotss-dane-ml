library(RANN)
df_search <- subset(y_date_2016, select=c("output_ra", "output_dec"))
gaia <- subset(gaia_all, select=c("ra", "dec"))
najblizsze <- RANN::nn2(data = gaia, query = df , k = 1)
najblizsze

