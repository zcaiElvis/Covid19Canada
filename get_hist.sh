rm -f intermediate/hist.csv
rm -f intermediate/hist_msg.csv
rm -f -r updates.nosync
mkdir updates.nosync

git log --all --oneline --follow --pretty=format:"%h" timeseries_canada/cases_timeseries_canada.csv >> intermediate/hist.csv
git log --all --oneline --follow --pretty=format:"%s" timeseries_canada/cases_timeseries_canada.csv >> intermediate/hist_msg.csv



# Run R script
R CMD BATCH modify_csv.R
#R CMD BATCH proc_dat.R
