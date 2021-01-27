setwd("C:/Users/hwwaal/Documents/projects/pest_fpr")
library(readxl)
library(tidyverse)

#reading substance data
sd_or <- read_excel("USEtox_substance_data_organics.xlsx", 
                    sheet = "Substance data")
sd_in <- read_excel("USEtox_substance_data_inorganics.xlsx", 
                    sheet = "Substance data")

#tidy substance data

rename(sd_or, "ID" = 1, 
       "Inorganics"= 41, 
       "Uncertainty"= 42, 
       "Surfactants" = 43, 
       "Organo-Metallics"= 44, 
       "Ecotox_EF"= 45, 
       "Cancer_inh_EF" = 46, 
       "Cancer_ing_EF" = 47, 
       "Non-cancer_inh_EF" = 48,
       "Non-cancer_ing_EF" = 49)
names_or <- sd_or[1,] #take out the column names of organic substances
units_or <- sd_or[2,] #take out the units of the organic substance columns


rename(sd_in, "ID" = 1, 
       "Inorganics"= 41, 
       "Uncertainty"= 42, 
       "Surfactants" = 43, 
       "Organo-Metallics"= 44, 
       "Ecotox_EF"= 45, 
       "Cancer_inh_EF" = 46, 
       "Cancer_ing_EF" = 47, 
       "Non-cancer_inh_EF" = 48,
       "Non-cancer_ing_EF" = 49)
names_in <- sd_in[1,] #take out the column names of inorganic substances
units_in <- sd_in[2,] #take out the units of the organic substance columns


sd_or <- slice(sd_or,-(1:3)) # remove first three rows
sd_in <- slice(sd_in,-(1:3)) # remove first three rows

head(sd_or)
head(sd_in)
write.csv(sd_or, file = "subst_data_org.csv")
write.csv(sd_in, file = "subst_data_in.csv")


