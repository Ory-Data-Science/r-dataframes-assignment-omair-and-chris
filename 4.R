shrub_volume <- read_csv("shrub-volume-experiments-table.csv")
print(shrub_data_manipulations <  inner_join(shrub_dimensions, shrub_volume_experiments_table, by="null"))

