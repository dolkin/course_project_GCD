---
title: "CodeBook"
author: "jin"
date: '2020 2 29 '
output: html_document
---

###Describing Features

Following the intruction of the assignment, this coodbook describes features in the data set.
The link of the repository includes 4 files.

Files:
==============================================
- "CodeBook.md": This file.
- "README.md": 
- "tidy_data.txt":
- "run_analysis.R": The source file.
==============================================


The source file, run_analysis.R, has a role which reads the data sets and tidy them.
As a result of work, the source file creates a tidy data which contains 4 variables.

Variables:
==============================================
- "subject_sn": This variable means each subject. The number of subjects is 30.
- "activity_type": This variable means each activity. The number of kind of activities is 6 including walking, sitting and so on.
- "measurement": This variable means each measurement. It includes mean and std data of all measurements.
- "mean": This variable means the mean value of each measurement. It varies from -1 to 1.