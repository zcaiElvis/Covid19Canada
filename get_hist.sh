rm -f hist.csv
rm -f hist_msg.csv
rm -f -r updates
mkdir updates

git log --all --oneline --follow --pretty=format:"%h" timeseries_canada/cases_timeseries_canada.csv >> hist.csv
git log --all --oneline --follow --pretty=format:"%s" timeseries_canada/cases_timeseries_canada.csv >> hist_msg.csv

R CMD BATCH modify_csv.R
