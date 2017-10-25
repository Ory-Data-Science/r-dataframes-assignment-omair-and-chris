#Import Data
shrub_data <- read_csv("./Data/shrub-volume-experiment.csv")

#avg volume by site
shrub_data%>%mutate("volume"=length*width*height)%>%group_by(site)%>%
        summarize(mean_volume = mean(volume))

#avg volume by experiment
shrub_data%>%mutate("volume"=length*width*height)%>%
        group_by(experiment)%>%summarize(mean_volume = mean(volume))