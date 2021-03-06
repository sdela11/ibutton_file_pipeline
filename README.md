# ibutton_file_pipeline.Rproj
For the import of .csv files generated by downloading iButton data.

#Files:

#ALL.csv
Contains ALL data from merging seasons 2020 and 2021 of the ibutton dataset

#File_pipeline_Itasca_2020_rawtoclean.Rmd
For use with files of name format type: "./RAW_DATA/i11_3E00000069B0E841_083020.csv"
Removes metadata header, standardizes column names.
May be outdated, since file names are now typically changed manually before cleaning.


#File_pipeline_Itasca_2021_rawtoclean.Rmd
Automatically assigns new name based on a correlation sheet (ibutton # -> name(site_rep_position_buttonID_season))
Removes metadata header (optional) and standardizes columns. Solves the problem of inconsistent splitting of date and time columns during original data download.


#clean_csv_merge.Rmd
Take clean csv files, convert all dates to unified POSIXct format, add columns of metadata.
Bind all of them together.
Creates ALL.csv !!!

#QUICK_list_of_filenames.R
Creates a quick list of filenames from desired folder. Name format: site_rep_position_buttonID_season
originally used with files that had "meta" in the name, so it may need to be modified for future use.

#data_cleaning.Rmd
Creates edited version of ALL.csv, removing compromised data and outliers.