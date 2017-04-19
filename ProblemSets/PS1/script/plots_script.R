hf = read.csv('factor.csv')
hf$age = abs(hf$age)
hf$hrs_mainjob = abs(hf$hrs_mainjob)
hf$hrs_otherjob = abs(hf$hrs_otherjob)
hf$hrs_alljob = abs(hf$hrs_alljob)
hf$hrs_takeoff = abs(hf$hrs_takeoff) 
hf$hrs_overwork = abs(hf$hrs_overwork)
hf$hispanic = factor(hf$hispanic)

hf16 = hf[hf$age > 16,]

library(ggplot2)
library(ggplot2)
library(tidyverse)
library(modelr)
library(broom)
library(plyr)
library(dplyr)
library(tidyr)
library(pROC)
library(miscset)
library(gridExtra)
library(gmodels)
library(MASS)

################################### age
age1 = ggplot(hf16, aes(age)) + 
  geom_histogram(aes(y = ..density..), 
                 position = "identity", bins = 20, 
                 color = 'maroon', alpha = 0.2) +
  ggtitle("Distribution of Age") +
  labs(x = "Age", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5)) +
  theme(plot.title = element_text(hjust = 0.5))

age2 = ggplot(hf16, aes(age)) + 
  geom_histogram(aes(y = ..density.., color = hispanic, fill = hispanic), 
                 bins = 20, position = "identity", alpha = 0.2) +
  ggtitle("Distribution of Age Categorized by Hispanic") +
  labs(x = "Age", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5)) +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(age1, age2, ncol = 2)

################################### hrs_main
hrs_main = ggplot(hf16, aes(hrs_mainjob)) + 
  geom_histogram(aes(y = ..density..), 
                 position = "identity", bins = 30, 
                 color = 'maroon', alpha = 0.2) +
  ggtitle("Distribution of Hours Working at Main Job (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5), limits = c(0, 50)) +
  theme(plot.title = element_text(hjust = 0.5))


hrs_main2 = ggplot(hf16, aes(hrs_mainjob)) + 
  geom_histogram(aes(y = ..density.., color = hispanic, fill = hispanic), 
                 bins = 30, position = "identity", alpha = 0.2) +
  ggtitle("Distribution of Hours Working on Main Job (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5), limits = c(0, 50)) +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(hrs_main, hrs_main2, ncol = 2)

################################### hrs_other
hrs_other = ggplot(hf16, aes(hrs_otherjob)) + 
  geom_histogram(aes(y = ..density..), 
                 position = "identity", bins = 30, 
                 color = 'blue', alpha = 0.2) +
  ggtitle("Distribution of Hours Working at Other Jobs") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5), limits = c(0, 50)) +
  theme(plot.title = element_text(hjust = 0.5))


hrs_other2 = ggplot(hf16, aes(hrs_otherjob)) + 
  geom_histogram(aes(y = ..density.., color = hispanic, fill = hispanic), 
                 bins = 20, position = "identity", alpha = 0.2) +
  ggtitle("Distribution of Hours Working on Other Job ") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 100, by = 5), limits = c(0, 30)) +
  theme(plot.title = element_text(hjust = 0.5))
grid.arrange(hrs_other, hrs_other2, ncol = 2)

################################### hrs_takeoff
hrs_takeoff1 = ggplot(hf16, aes(hrs_takeoff)) + 
  geom_histogram(aes(y = ..density..), 
                 position = "identity", bins = 20, 
                 color = 'maroon', alpha = 0.2) +
  ggtitle("Distribution of Hours Taking-off (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 20, by = 5), limits = c(0, 20)) +
  theme(plot.title = element_text(hjust = 0.5))

hrs_takeoff2 = ggplot(hf16, aes(hrs_takeoff)) + 
  geom_histogram(aes(y = ..density.., color = hispanic, fill = hispanic), 
                 position = "identity", bins = 20, alpha = 0.2) +
  ggtitle("Distribution of Hours Taking-off (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 20, by = 5), limits = c(0, 20)) +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(hrs_takeoff1, hrs_takeoff2, ncol = 2)

################################### hrs_takeoff
hrs_overwork1 = ggplot(hf, aes(hrs_overwork)) + 
  geom_histogram(aes(y = ..density..), 
                 position = "identity", bins = 20, 
                 color = 'maroon', alpha = 0.2) +
  ggtitle("Distribution of Hours Overtime (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 10, by = 1), limits = c(0, 10)) +
  theme(plot.title = element_text(hjust = 0.5))

hrs_overwork2 = ggplot(hf, aes(hrs_overwork)) + 
  geom_histogram(aes(y = ..density.., color = hispanic, fill = hispanic), 
                 position = "identity", bins = 20, alpha = 0.2) +
  ggtitle("Distribution of Hours Overtime (Age > 16)") +
  labs(x = "Hours", y = "Percent of observations in bin") +
  scale_x_continuous(breaks = seq(0, 10, by = 1), limits = c(0, 10)) +
  theme(plot.title = element_text(hjust = 0.5))
grid.arrange(hrs_overwork1, hrs_overwork2, ncol = 2)
