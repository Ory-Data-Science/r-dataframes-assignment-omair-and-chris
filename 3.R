#1
print(shrub_dimensions%>%group_by(experiment)%>%summarize(avg_height=mean(height)))
#this does several things:
#take shrub_dimensions dataframe
#group shrub_dimensions dataframe by experiment column
#take the grouped dataframe and calculate out average height using the mean of height
#print out result

#2
print(shrub_dimensions%>%group_by(site)%>%summarize(max_height=max(height)))
#similar to #1
#instead of determining mean, here we use the max of height to determine max height