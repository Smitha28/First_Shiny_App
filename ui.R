#Uncomment and run the following commands if you have the packages installed already.
#If not installed, run install.packages("package name") command and then execute the below.
#library(dplyr)
#library(ggplot)
#library(DT)
#library(RColorBrewer)
#library(ggthemes)

#Select all breeds
all_breeds <- sort(unique(dogs$BreedName))


shinyUI(fluidPage(
  
  titlePanel("Who let the dogs out?"),
  
  sidebarLayout(position='right',
                
                sidebarPanel(
                  #Select the Breed Name
                  selectInput(inputId="BreedName",
                              label="Select Breed: ",
                              choices=all_breeds,
                              selected="Labrador Retriever",
                              selectize = TRUE, multiple=TRUE),
                  
                #Select vairable for x-axis
                selectInput(inputId='x',
                            label="x-axis",
                            choices=c("AnimalGender","BreedName"),
                            selected="AnimalGender")),
              
                #Outputs
                mainPanel(
                  
                  plotOutput(outputId = "barplot"),
                  DT::dataTableOutput(outputId = "dogstable")
                  
                )
    )
  )
)