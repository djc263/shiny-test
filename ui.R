library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Fights from MTCARS"),
  
  # Sidebar with controls to provide a caption, select two makes
  # So you can get the applicable bar plots from the makes
  sidebarLayout(
    sidebarPanel(
      h6("This app is a simple aid for comparing between the overall averages of all included vehicles for any 2 makes in the MTCARs Database, just select your makes and reveiw the graphs for those makes side by side"),
      selectInput("dataset1", "Choose a Make:", 
                  c("Mazda","Datsun","Hornet","Valiant","Duster","Merc","Cadillac","Lincoln","Chrysler","Fiat","Honda","Toyota","Dodge","AMC","Camaro","Pontiac","Lotus","Ford","Ferrari","Maserati","Volvo")),      
      selectInput("dataset2", "Choose a different Make:", 
                  c("Mazda","Datsun","Hornet","Valiant","Duster","Merc","Cadillac","Lincoln","Chrysler","Fiat","Honda","Toyota","Dodge","AMC","Camaro","Pontiac","Lotus","Ford","Ferrari","Maserati","Volvo"))       
    ),
    
    
    # Show the caption, a summary of the dataset and an HTML 
    # table with the requested graphs
    mainPanel(
      h3(textOutput("caption", container = span)),
         
      plotOutput("distPlot")
      
    )
  )
))