library(stringr)

csv_files <- list.files(path="updates", full.name=TRUE)

# function track changes of one date # example track changes of day 2022-01-10



# Read date list:
date_list <- read.table("intermediate/commits.csv", header=TRUE, sep="")
date_list <- sort(date_list[,1])

# Read last file:

last_idx <- length(date_list)
df_last<- read.table(csv_files[last_idx], header=TRUE, sep=",")
df_last<- df_last[]
