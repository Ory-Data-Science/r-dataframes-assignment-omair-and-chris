<<<<<<< HEAD
#Import Data
shrub_data <- read_csv("./Data/shrub-volume-experiment.csv")

#avg volume by site
shrub_data%>%mutate("volume"=length*width*height)%>%group_by(site)%>%
        summarize(mean_volume = mean(volume))

#avg volume by experiment
shrub_data%>%mutate("volume"=length*width*height)%>%
        group_by(experiment)%>%summarize(mean_volume = mean(volume))
=======
shrub_data <- read_csv("shrub-volume-experiment.csv")

avg_vol_by_site <- shrub_data%>%mutate("volume"=length*width*height)%>%group_by(site)%>%
        summarize(mean_volume = mean(volume))

avg_vol_by_experiment <- shrub_data%>%mutate("volume"=length*width*height)%>%
  group_by(experiment)%>%summarize(mean_volume = mean(volume)))
#shrub_data %>%
#  mutate(volume = length * width * height) %>%
#group_by(experiment) %>%
#  summarize(mean_volume = mean(volume))
>>>>>>> e96e37f0878c8768309a9af28f3b1404ce78df7d
