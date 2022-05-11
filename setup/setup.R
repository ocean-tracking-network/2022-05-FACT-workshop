## Requirements------

### R version: 3.6.x or newer (recommend 4.2.x) and RStudio.

# Once R/RStudio is installed: open RStudio and run this install script. Please run it line-by-line instead of all at once in case there are errors.

#Note: When running through the installs, you may encounter a prompt asking you to upgrade dependent packages.
      #Choosing Option `3: None`, works in most situations and will prevent upgrades of packages you weren't explicitly looking to upgrade.

## WORKSHOP REQUIREMENTS ----
# Tidyverse (data cleaning and arrangement)
install.packages('tidyverse')

# Lubridate - part of Tidyverse, improves the process of creating date objects
install.packages('lubridate')

# GGmap - complimentary to ggplot2, which is in the Tidyverse
install.packages('ggmap')

# Plotly - Interactive web-based data visualization
install.packages('plotly')

# Viridis - color scales in this package are easier to read by those with colorblindness, and print well in grey scale.
install.packages("viridis")

### Dataset and Code -----
# Once the packages are installed, you can download the datasets and code for this workshop from https://github.com/ocean-tracking-network/2022-05-FACT-workshop.
# 1) Select the GREEN "code" button at the top and choose "Download ZIP"
# 2) Unzip the folder and move to secure location on your computer (Documents, Desktop etc.)
# 3) Copy the folder's path and use it to set your working directly in R using `setwd('<path-to-folder>')`.

# If you are familiar with Git and Github, feel free to clone this repository as you normally would,
# by running `git clone https://github.com/ocean-tracking-network/2022-05-FACT-workshop.git` in a terminal program
# and following from step 3 above.
