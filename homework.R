#Part 1
#enable tidyverse packages: includes dplyr
require(tidyverse)
setwd("~/GitHub/r-dataframes-assignment-omair-and-chris")

#Part 2
shrub_dimensions <- read_csv("shrub-volume-experiment.csv")
#1
names(shrub_dimensions)
#2
str(shrub_dimensions)
#3
head(shrub_dimensions)
#4
print(select(shrub_dimensions, length))
#5
print(select(shrub_dimensions, site, experiment))
#6
print(shrub_dimensions%>%filter(height>5))
#7
print(shrub_data_w_vols <- mutate(shrub_dimensions, "volume" = length*width*height))

#Part 3
#1
print(shrub_dimensions%>%group_by(experiment)%>%summarize(avg_height=mean(height)))
#2
print(shrub_dimensions%>%group_by(site)%>%summarize(max_height=max(height)))

#Part 4
shrub_volume_experiments_table <- read_csv("shrub-volume-experiments-table.csv")
print(shrub_data_manipulations <-  inner_join(shrub_dimensions, shrub_volume_experiments_table, by="experiment"))

#Part 5
#Read data, then determine average volume by site, then determine average volume by experiment
shrub_data <- read_csv("shrub-volume-experiment.csv")
print(avg_vol_by_site <- shrub_data%>%mutate("volume"=length*width*height)%>%group_by(site)%>%
        summarize(mean_volume = mean(volume)))
print(avg_vol_by_experiment <- shrub_data%>%mutate("volume"=length*width*height)%>%
        group_by(experiment)%>%summarize(mean_volume = mean(volume)))
#It is important to name variables based on what it is supposed to contain.
#In this case, I rewrote the code to output a data frame which is then printed, ensuring I can later review it easily.
#If we open up the table, we see the column name as intended and the output mean.
#Long data files should be annotated periodically so that the coder and future readers can interpret what is intended by the code.
#Usage of autocomplete and separating code into multiple lines (unlike what I have done here) can also improve readability and troubleshooting.
#The best way to ensure the data is correct is to manually interpret several values of the intended output yourself if possible.

#Part 6
require(dbplyr)
require(RSQLite)
portaldb <- src_sqlite("portal_mammals.sqlite")
surveys <- tbl(portaldb, "surveys")
#1
surveys%>%select(year, month, day, species_id)
#2
surveys%>%filter(!is.na(weight))%>%mutate("weight_kg"=weight/1000)%>%select(year, species_id, weight_kg)
#3
collect(surveys)%>%filter(!is.na(weight))%>%distinct(species_id)
#this interestingly yields the correct result
#incorrect result from:
#surveys%>%filter(!is.na(weight))%>%distinct(species_id)

#Part 7
#1 - total 25 rows
collect(surveys)%>%filter(!is.na(weight))%>%distinct(species_id)
#2
NL_avg_weight_kg <- collect(surveys)%>%filter(species_id=="NL"&!is.na(weight))%>%
  summarize(avg_weight=mean(weight)/1000)
#3
yearly_count <- collect(surveys)%>%group_by(year)%>%tally(.)

#Challenge
surveys <- tbl(portaldb, "surveys")
plots <- tbl(portaldb, "plots")
species <- tbl(portaldb, "species")
data <- list(surveys, plots, species)
avg_weight_species_on_control_R <-
  collect(inner_join(inner_join(surveys, plots, by="plot_id"), species, by="species_id"))%>%
  filter(plot_type=="Control"&taxa=="Rodent"&!is.na(weight))%>%group_by(genus, species)%>%
  summarize(avg_weight_kg=mean(weight)/1000.)