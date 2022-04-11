library(stringr)

### Read list of files
csv_files <- list.files(path="updates.nosync", full.name=TRUE)
date_list <- read.table("intermediate/commits.csv", header=TRUE, sep="")
date_list <- sort(date_list[,1], decreasing=FALSE)


### Construct base file from the newest edition
latest <- read.csv(tail(csv_files, 1), header=TRUE, sep=",")
df_covid <- latest
df_covid$reported <- rep(NA, length(nrow(df_covid)))



### Fill the base file with the newest
### date of each file as the "reported"
for(i in 1:length(csv_files)){
  df <- read.csv(csv_files[i], header=TRUE, sep=",")
  lastofdf <- tail(df, 1)
  df_covid[which(df_covid$date_report == lastofdf$date_report),]$reported <- lastofdf$cases
}

### "revised" column is the "cases" column of the base file
df_covid$revised <- df_covid$cases

### save to data
df_covid <-subset(df_covid, select = c(date_report, reported, revised))
write.table(x = df_covid, file="intermediate/changes.csv", col.names=TRUE, row.names=FALSE, sep=",")


# # Set last
# last_few <- length(date_list)
# csv_files <- tail(csv_files, last_few)
# date_list <- tail(date_list, last_few)
# 
# 
# # Create output dateframe:
# df_covid <- data.frame(date=date_list, val = rep("", length(date_list)))
# 
# # Construct matrix
# inter <- length(date_list)
# for(i in 1:inter){
#   df <- read.csv(csv_files[i], header=TRUE, sep=",")
#   df <- tail(df, i)
#   df$date_report <- strptime(as.Date(df$date_report, "%d-%m-%Y"), "%Y-%m-%d")
#   idx <- which(df_covid$date == df$date_report)
#   
#   df_covid[idx,]$val <- paste(df_covid[idx,]$val, df[idx,]$cases)
# }
# 
# write.table(x = df_covid, file="intermediate/changes.csv", col.names=TRUE, row.names=FALSE)
# 
