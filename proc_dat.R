library(stringr)

<<<<<<< HEAD
csv_files <- list.files(path="updates.nosync", full.name=TRUE)
date_list <- read.table("intermediate/commits.csv", header=TRUE, sep="")
date_list <- sort(date_list[,1], decreasing=FALSE)

# Set last
last_few <- 50
csv_files <- tail(csv_files, last_few)
date_list <- tail(date_list, last_few)


# Create output dateframe:
df_covid <- data.frame(date=date_list, val = rep("", length(date_list)))


# Construct matrix
inter <- length(date_list)
for(i in 1:inter){
  df <- read.csv(csv_files[i], header=TRUE, sep=",")
  df <- tail(df, i)
  df$date_report <- strptime(as.Date(df$date_report, "%d-%m-%Y"), "%Y-%m-%d")
  idx <- which(df_covid$date == df$date_report)
  print(idx)
  df_covid[idx,]$val <- paste(df_covid[idx,]$val, df[idx,]$cases)
}




write.table(x = df_covid, file="intermediate/changes.csv", col.names=TRUE, row.names=FALSE)

