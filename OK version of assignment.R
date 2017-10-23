require(tidyverse)

shrub_dimensions <- read_csv("shrub-volume-experiment.csv")

names(shrub_dimensions)

# > names(shrub_dimensions)
#[1] "site"       "experiment" "length"     "width"     
#[5] "height"


#function 2 
str(shrub_dimensions)
#what was spit out of this function
#Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	12 obs. of  5 variables:
#$ site      : int  1 1 1 2 2 2 3 3 3 4 ...
#$ experiment: int  1 2 3 1 2 3 1 2 3 1 ...
#$ length    : num  2.2 2.1 2.7 3 3.1 2.5 1.9 1.1 3.5 2.9 ...
#$ width     : num  1.3 2.2 1.5 4.5 3.1 2.8 1.8 0.5 2 2.7 ...
#$ height    : num  9.6 7.6 2.2 1.5 4 3 4.5 2.3 7.5 3.2 ...
#- attr(*, "spec")=List of 2
#..$ cols   :List of 5
#.. ..$ site      : list()
#.. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#.. ..$ experiment: list()
#.. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
#.. ..$ length    : list()
#.. .. ..- attr(*, "class")= chr  "collector_double" "collector"
#.. ..$ width     : list()
#.. .. ..- attr(*, "class")= chr  "collector_double" "collector"
#.. ..$ height    : list()
#.. .. ..- attr(*, "class")= chr  "collector_double" "collector"
#..$ default: list()
#.. ..- attr(*, "class")= chr  "collector_guess" "collector"
#..- attr(*, "class")= chr "col_spec"
#> 


head(shrub_dimensions)
## A tibble: 6 x 5
#site experiment length width height
#<int>      <int>  <dbl> <dbl>  <dbl>
#  1     1          1    2.2   1.3    9.6
#2     1          2    2.1   2.2    7.6
#3     1          3    2.7   1.5    2.2
#4     2          1    3.0   4.5    1.5
#5     2          2    3.1   3.1    4.0
#6     2          3    2.5   2.8    3.0


