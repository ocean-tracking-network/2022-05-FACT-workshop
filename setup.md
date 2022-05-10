---
title: Setup
---

## Requirements

You will requre 
1. all the correct programs, 
1. all the listed R packages 
1. the dataset and code. Instructions for all these are below.

If you are an R beginner, we **strongly** recommend following along with lessons 2 through 4 (background lessons) before this workshop begins. You can use the setup instructions below, then begin working through the curriculum here [https://ocean-tracking-network.github.io/2022-05-FACT-workshop/](https://ocean-tracking-network.github.io/2022-05-FACT-workshop/). If you encounter any errors or questions you may reach out to OTNDC@DAL.CA for assistance. These background lessons will be a great resource to ensure you can follow along the "Telemetry Report Creation" steps.


### Please see the attached document for program instructions: - [Program Install Instructions.docx](/Resources/install_instructions.docx)
- R version: 3.6.x or newer (recommend 4.2.x) 
- RStudio

Once all of the programs are installed, open RStudio and run the below package install scripts. It's best to run it line by line instead of all at once in case there are errors.

<b>Note:</b> When running through the installs, you may encounter a prompt asking you to upgrade dependent packages. Choosing Option `3: None`, works in most situations and will prevent upgrades of packages you weren't explicitly looking to upgrade.

### Beginning R Workshop Requirements

```r

# Tidyverse (data cleaning and arrangement)
install.packages('tidyverse')

# Lubridate - part of Tidyverse, improves the process of creating date objects
install.packages('lubridate')

# GGmap - complimentary to ggplot2, which is in the Tidyverse
install.packages('ggmap')

# Plotly - Interactive web-based data visualization
install.packages('plotly')

# ReadXL - reads Excel format
install.packages("readxl")

# Viridis - color scales in this package are easier to read by those with colorblindness, and print well in grey scale.
install.packages("viridis")
```


# Dataset and Code

<b>Once the above packages are installed</b>, you can download the datasets and code for this workshop from <b>[this link](https://github.com/ocean-tracking-network/2022-05-FACT-workshop)</b>

1. Select the GREEN "Code" button at the top and choose "Download ZIP"
1. Unzip the folder and move to secure location on your computer (Documents, Desktop etc.)
1. Copy the folder's path and use it to set your working directly in R using `setwd('<path-to-folder>')`.

If you are familiar with Git and Github, feel free to clone this repository as you normally would, by running `git clone https://github.com/ocean-tracking-network/2022-05-FACT-workshop.git` in a terminal program and following from step `3` above.





{% include links.md %}
