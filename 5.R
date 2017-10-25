shrub_data <- read_csv("shrub-volume-experiment.csv")

avg_vol_by_site <- shrub_data%>%mutate("volume"=length*width*height)%>%group_by(site)%>%
        summarize(mean_volume = mean(volume))

avg_vol_by_experiment <- shrub_data%>%mutate("volume"=length*width*height)%>%
  group_by(experiment)%>%summarize(mean_volume = mean(volume)))
#shrub_data %>%
#  mutate(volume = length * width * height) %>%
#group_by(experiment) %>%
#  summarize(mean_volume = mean(volume))