if (!require("pacman")) install.packages("pacman")

pacman::p_load(pacman, party, psych, rio, tidyverse)

(df <- read_csv("data/Fit.csv"))

boxplot(df$`Step count`)

summary(df)
