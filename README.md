test
====

This repository is for the Coursera.org Getting and Cleaning data project assignment.

For this assignment I have created a R script, run_analysis(), that takes the provided data and summarizes a
portion of the dataset.

I downloaded the data manually to a preferred directory.

First
Please be aware that I am by far no R coding expert.  So my approach is probably more brute force, but works.


The run_analysis script loads the previously downloaded data into multiple data tables.  I break up the tables 
by tst and trn.

I update the activty from a generic number to a specific label as was provided.

We were asked to utilize the Mean and Standard Deviation data.  For this I selected 66 columns that I believe were intended
for the assignment.  More details in the codebook.

Having loaded the datatables.  The script column binds the data, then rowbinds the test and train results.  The 
mean for each of the 66 measure is calculated with respect to each of the Activities and subjects.

Lastly the results are written out to a tab delimited text file that avoids any fields or values from containing 
double quotes.