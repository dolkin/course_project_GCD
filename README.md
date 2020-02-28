---
title: "README"
author: "jin"
date: '2020 2 29 '
output: html_document
---

###Explaning how the source file makes tidy data

Following the intruction of the assignment, the source file, run_analysis.R, creates a tidy data.
The source file works for steps.

==============================================
1. Loads the data sets and put them into each variable.
2. Changes the names of columns of variables and binds those data sets.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Turns into a narrow-typed data and makes a independent tidy data set with the average of each variable for each activity and each subject.
==============================================


The intruction of the assignment requires a independent tidy data set with the average of 1)each variable for 2)each activity and 3)each subject.
And the final data set from the source file is guaranteed with its character of tidiness.
The following is the reasons.

==============================================
- The tidy data set needs to include the mean and standard deviation for each measurement.
- The number of the mean for each measurement is 46 and the number of the standard deviation for each measurement is 33.
- The number of subjects is 30.
- The number of activities is 6.
- The multiple number of all things is 14220.
- The tidy data set, tidy_data.txt, has 14220 rows.
- This means all rows are independent data.
- All rows contain the average data of each measurement for each activity and each subject and are never duplicated.
==============================================


The source file has some annotation for each code line or code blocks.
I hope those annotation could help you interpret and understand what the lines mean.