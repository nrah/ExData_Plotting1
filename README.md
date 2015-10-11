# Exploratory Data Analysis Project 1

This repo contains my files for the first course project of the October 2015 run of Exploratory Data Analysis by Coursera/Johns Hopkins University.

The data come from the [Individual household electric power consumption Data Set](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption) from the UCI Machine Learning Repository.

Each R script produces the corresponding PNG plot file given that household\_power\_consumption.txt from the dataset exists in the working directory.

The scripts read in the relevant data for the two days by skipping all the preceding lines and reading in the 2880 lines that match the days. I found the line numbers for the days with the Linux command line:
`grep -n '^[12]/2/2007' household_power_consumption.txt | head -n 1`
