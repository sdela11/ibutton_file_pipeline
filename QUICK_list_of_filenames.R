#title: "Quick work. Create .csv of filenames"
#author: "Sara DeLaurentis"
#date: "03/26/2022"
#output: html_document
#purpose: Attach BASE columns of metadata from filenames that will be helpful for analysis. ("site", "rep", "position", "buttonID", "season")

library(tidyverse)
library(stringr)
library(stringi)
library(dplyr)
library(glue)

#Some copy/paste from "File_pipeline_Itasca_add_meta.Rmd"

#SWITCH WORKING DIRECTORY BASED ON DEVICE YOU'RE USING

setwd("C:/Users/sbaue/coding/R_TEMPRY/Itasca_project_19-21/CLEAN_DATA_with_meta") #For Home desktop
#setwd("C:/Users/sbaue/coding/Itasca_project_19-21/CLEAN_DATA_with_meta") #For Lenovo Flex


file.names <- list.files(pattern = "meta", full.names = FALSE) #create list of .csv files
name.data <- file.names %>%  #create dataframe from file.names, with ".csv" removed.
  str_replace(".csv", "") %>% #remove ".csv"
  str_replace("meta_", "") %>%  #remove "meta_"
  as_data_frame() #coerce to dataframe
head(name.data)
view(name.data)

full.file.names <- list.files(pattern = "meta", full.names = TRUE) %>% #create dataframe out of list of full file names.
  as_tibble()

#full.file.names <- list.files(pattern = ".csv", full.names = TRUE) 
#head(full.file.names)

input_df <- cbind(full.file.names, name.data) #bind the two dataframes together
colnames(input_df) <- c("full_paths", "labels")
head(input_df)
tail(input_df)
view(input_df)

#create a dataframe of the "label" elements
add_meta <- function(full_paths,labels){
  
  # setwd("C:/Users/sbaue/coding/R_TEMPRY/Itasca_project_19-21/CLEAN_DATA_copy")
  setwd("C:/Users/sbaue/coding/Itasca_project_19-21/CLEAN_DATA_copy")
  temps <- read.csv(full_paths)
  meta <- labels %>%    
    str_split_fixed("_", n=5) %>% 
    as.data.frame()
  colnames(meta) <- c("site", "rep", "position", "buttonID", "season")

