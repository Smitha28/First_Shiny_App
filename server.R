library(RColorBrewer)

shinyServer(function(input, output) {
  
  #Create the barplot object the plotOutput function is expecting
  output$barplot <- renderPlot({
    req(input$BreedName)
    
    dog_breeds <- dogs %>%
      filter(BreedName %in% input$BreedName) 
    
    if (input$x=="AnimalGender"){
      ggplot(as.data.frame(table(dogs$AnimalGender,dogs$Borough)), aes(x=Var1, y = Freq, fill=Var2)) +
      geom_bar(stat="identity")+ #barplot
      xlab("Gender")+ylab("Count")+ #Renaming x-label and y-label
      scale_fill_brewer("Borough")+ #Using color combo
      facet_grid(.~Var2)
      }
    else if(input$x=="BreedName"){
      top_breeds=as.data.frame(table(dogs$BreedName))
      colnames(top_breeds)[colnames(top_breeds)=="Var1"] <- "BreedName"
      colnames(top_breeds)[colnames(top_breeds)=="Freq"] <- "Count"
      top_breeds=top_breeds[order(top_breeds$Count, decreasing = TRUE),]
      max_breeds=top_breeds[1:10,]
      
      max_breeds$BreedName=factor(max_breeds$BreedName, 
                                  levels=c("Pomeranian",
                                          "Labrador Retriever Crossbreed",
                                          "American Pit Bull Terrier/Pit Bull",
                                          "American Pit Bull Mix / Pit Bull Mix",
                                          "Labrador Retriever",
                                          "Maltese",
                                          "Chihuahua",
                                          "Shih Tzu",
                                          "Yorkshire Terrier",
                                          "Unknown"))
    
      ggplot(max_breeds, aes(x=BreedName, y=Count, fill=Count))+
        geom_bar(stat="identity")+
        geom_text(stat="identity", aes(label=Count), vjust=-0.5)+
        scale_fill_continuous(low="blue", high="red")+
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
        
    }
    })
  
  # Create data table
  output$dogstable <- DT::renderDataTable({
    req(input$BreedName)
    
    dog_breeds <- dogs %>%
      filter(BreedName %in% input$BreedName) %>%
      select(AnimalName:ZipCode)
    
    DT::datatable(data = dog_breeds, 
                  options = list(pageLength = 5), 
                  rownames = FALSE)
  })
    
})