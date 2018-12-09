# Shiny_App
My very first Shiny App: "Who let the dogs out?"

You can read more detailed information on where I got the dataset and how I cleaned it from my blogpost: https://smitha-achar.com/portfolio/my-first-shiny-app/

1. For a high level understanding, make sure you have all the packages as mentioned in the ui.R script and server.R script otherwise your RStudio might throw some odd errors. 
2. Open RStudio and make sure you have downloaded the files into the right directory. 
3. Set your directory to where the files are located. Use setwd() function. 
4. Read in the file to the variable "dogs" as most of the functions in the script refer to that. I did it using the >>>dogs=read.csv("filepath",stringsAsFactors=FALSE) 

5. Use the below code to then run the program. If you have followed the above steps it should be pretty easy. 
If you run into any problems, I'd be happy to help! 
>>>shiny::runGitHub('Shiny_App', 'Smitha28')

P.S. For those who are beginners to Shiny & R/don't have RStudio installed yet, I am working on getting it published on ShinyApps.io. Will keep posted here if I eventually do it! 
