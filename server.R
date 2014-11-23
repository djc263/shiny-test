library(shiny)
library(datasets)

# So this is an App for bragging on your favorite make using the mtcars dataset
##because honestly I had no idea what to do for this project
shinyServer(function(input, output) {
  
  # By declaring datasetInput1&2 as a reactive expressions we ensure 
  # that:
  #
  #  1) They are called when the inputs it depends on changes
  #  2) The computation and result are shared by all the callers 
  #    (it only executes a single time)
  #  3)you can keep changing the comparison  
  datasetInput1 <- reactive({
    switch(input$dataset1,
           "Mazda" = "Mazda",
           "Datsun" = "Datsun",
           "Hornet" = "Hornet",
           "Valiant" = "Valiant",
           "Duster" = "Duster",
           "Merc" = "Merc",           
           "Cadillac" = "Cadillac",
           "Lincoln" = "Lincoln",
           "Chrysler" = "Chrysler",
           "Fiat" = "Fiat",
           "Honda" = "Honda",
           "Toyota" = "Toyota",
           "Dodge" = "Dodge",
           "AMC" = "AMC",
           "Camaro" = "Camaro",
           "Pontiac" = "Pontiac",
           "Lotus" = "Lotus",
           "Ford" = "Ford",
           "Ferrari" = "Ferrari",
           "Maserati" = "Maserati",
           "Volvo" = "Volvo")
  })
  datasetInput2 <- reactive({
    switch(input$dataset2,
           "Mazda" = "Mazda",
           "Datsun" = "Datsun",
           "Hornet" = "Hornet",
           "Valiant" = "Valiant",
           "Duster" = "Duster",
           "Merc" = "Merc",           
           "Cadillac" = "Cadillac",
           "Lincoln" = "Lincoln",
           "Chrysler" = "Chrysler",
           "Fiat" = "Fiat",
           "Honda" = "Honda",
           "Toyota" = "Toyota",
           "Dodge" = "Dodge",
           "AMC" = "AMC",
           "Camaro" = "Camaro",
           "Pontiac" = "Pontiac",
           "Lotus" = "Lotus",
           "Ford" = "Ford",
           "Ferrari" = "Ferrari",
           "Maserati" = "Maserati",
           "Volvo" = "Volvo")
  })  
  # The output$caption is computed based on a reactive expression
  # It just highlights the present comparison to make it look pretty
  #
  #  1) This function is automatically called to recompute the 
  #     output 
  #  2) The new caption is pushed back to the browser for 
  #     re-display


  
  output$caption <- renderText({
    out=paste0(datasetInput1()," Compared to ",datasetInput2())
    out
  })
  
 ##needed to give the mtcars data explicit makes because otehrwise I have no point to this at all 
  
  mat <- do.call("rbind", strsplit(sub(" ", ";", row.names(mtcars)), ";"))
  colnames(mat) <- c("MAKE", "MODEL")
  mtcarsu<-cbind(mtcars,mat)
  
  
  # The output$distPlot replots based on a reactive expression
  # It gives you the visual comparison that is the "point"
  #
  #  1) This function is automatically called to recompute the 
  #     output 
  #  2) New Graphs get pushed on user changes
  
  output$distPlot <- renderPlot({
    mtcarsu1<-mtcarsu[mtcarsu$MAKE==datasetInput1(),]
    mtcarsu2<-mtcarsu[mtcarsu$MAKE==datasetInput2(),]
    su11<-colMeans(mtcarsu1[,c(3,4)])
    su12<-colMeans(mtcarsu1[,c(5:11)])
    su21<-colMeans(mtcarsu2[,c(3,4)])
    su22<-colMeans(mtcarsu2[,c(5:11)])
    
    par(mfrow=c(2,2))
    barplot(su11,main=datasetInput1())
    barplot(su12,main=datasetInput1())
    barplot(su21,main=datasetInput2())
    barplot(su22,main=datasetInput2())
  })
})