{
test_conditions <- read.csv("test_gaia_lotts_neightbor_conditions.csv")

for(i in 1:nrow(test_conditions)) 
  {
  if (lotss_neightbour_results_nearest$closest_neightbour_id[which(lotss_neightbour_results_nearest$source_name == test_conditions[i, "lotss_source_name"])] ==  test_conditions[i, "gaia_neightbor_id"]) 
  {
    print(sprintf("Powodzenie: Warunek: %i testowy został spelniony", i))
  }
  else print(sprintf("UWAGA: nie został spełniony warunek: %i", i))
}
}
