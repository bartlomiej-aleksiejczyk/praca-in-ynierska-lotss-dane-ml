len_lotss <- nrow(results_half)
x<-1:len_lotss
new_ra<- vector("numeric",len_lotss)
new_dec<- vector("numeric",len_lotss)

for (lotss_num in(1:len_lotss))
{
  new_ra[lotss_num]<-abs(results_half[lotss_num,"gaia_converted_ra"])
  new_dec[lotss_num]<-abs(results_half[lotss_num,"gaia_converted_dec"])
}
library(scatterplot3d)
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 90, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 90deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
plot(x,delta_ra)
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 00, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 0deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
plot(x,delta_ra)
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 180, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 180deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 270, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 270deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 235, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 235deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 45, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 235deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
scatterplot3d(x=x, y=new_ra, z=new_dec, 
              angle = 135, 
              grid = TRUE,
              main="Wykres 3d dla współrzędnych znalezionych sąsiadów 135deg",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Skorygowana wartość rektascensji [deg]",
              zlab = "Skorygowana wartość deklinacji [deg]")
plot(x,delta_ra)
delta_ra<- vector("numeric",len_lotss)
delta_dec<- vector("numeric",len_lotss)

for (lotss_num in(1:len_lotss))
{
  delta_ra[lotss_num]<-abs(results_half[lotss_num,"gaia_converted_ra"]-results_half[lotss_num,"ra"])
  delta_dec[lotss_num]<-abs(results_half[lotss_num,"gaia_converted_dec"]-results_half[lotss_num,"dec"])
}
plot(x,delta_ra)
plot(x,delta_dec)

scatterplot3d(x=x, y=delta_ra, z=delta_dec, 
              angle = 90, 
              grid = TRUE,
              main="Wykres 3d dla delty sąsiadów",
              xlab = "Liczba porządkowa współrzędnej",
              ylab = "Delta ra [deg]",
              zlab = "Delta dec [deg]")
plot(x,delta_ra)
plot(x,delta_dec)
