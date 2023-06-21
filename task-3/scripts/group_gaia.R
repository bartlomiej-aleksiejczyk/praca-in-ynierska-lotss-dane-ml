gaia_length=nrow(all_gaia)

#Sprawdzenie czy ile liczb jest większych lub równych od dolnej granicy i mniejszych od górnej
bottom_limit <- c(1, 2.5, 5, 10, 25)
upper_limit  <- c(2.5, 10, 10, 25, 50)
occurences  <- rep(0, 5)
limit_length <-length(bottom_limit)

for (limit_index in 1:limit_length)
{
  occurences[limit_index] <- (length(which(all_gaia$parallax >= bottom_limit[limit_index] & all_gaia$parallax < upper_limit[limit_index])))
}
gaia_parallax_query <- cbind(bottom_limit,upper_limit,occurences)
 