## Getting and Cleaning Data
#### Data Science Specialization

Project of the course Getting and Cleaning Data.

The script `run_analysis.R` was created to collect and clean the data set
obtained as part of a set of experiments performed in a study of human activity
recognition using smartphones.

The R packages [dplyr] and [stringr] need to be installed to run the script.

The script consists of a set of command lines that together with two functions
collect and clean the data. 

The raw data is loaded into R from different files, 
and is merged into a data set contaning the variables of interest, the resulting
data set is called `raw_data`.

Next, the `tidy_data` function receives the raw_data as input and carries out
steps 2, 3 and 4 of the analysis.

The function `tidy_data_mean` then performs step 5 of the assignment.

These functions are called at the end of the script.





