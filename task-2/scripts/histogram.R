hist(lotss_neightbour_results_nearest[,"closest_neightbour_dist_sec"],
     breaks=(65),
     main="Dystans obiektu do najbliższego sąsiada - histogram",
     xlab="Dystans w sekundach",
     xlim=c(0,2200),
     col="darkmagenta",
     freq=TRUE
)