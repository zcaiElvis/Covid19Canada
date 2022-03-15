library(dplyr)

api_commit <- read.table("intermediate/hist.csv")
api_info <- read.table("intermediate/hist_msg.csv", fill=TRUE)
api_short <- data.frame(Date = api_info$V3[1:100], Commit = api_commit$V1[1:100])
api_short$Date <- as.Date(api_short$Date)
api_short <- group_by(api_short, Date)


write.table(x = api_short, file="intermediate/commits.csv", col.names=TRUE, row.names=FALSE)

git_c1 <- "git show --name-only "
git_c2 <- ":timeseries_canada/cases_timeseries_canada.csv >> updates.nosync/"  
git_c3 <- ".csv"

for (row in 1:nrow(api_short)){
  date <- api_short$Date[row]
  comm <- api_short$Commit[row]
  git_command <- paste(git_c1, as.character(comm), git_c2, as.character(date), git_c3, sep="")
  system(git_command)
}

print(paste("Success, time: ", as.character(Sys.time())), sep="")

