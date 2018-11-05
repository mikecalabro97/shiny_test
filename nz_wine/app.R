#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(readxl)
library(janitor)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("New Zealand Wine"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "x",
                    label = "X-axis",
                    choices = c("2009" = "x2009",
                                "2010" = "x2010",
                                "2011" = "x2011",
                                "2012" = "x2012",
                                "2013" = "x2013",
                                "2014" = "x2014",
                                "2015" = "x2015",
                                "2016" = "x2016",
                                "2017" = "x2017")
                                ),
        
        selectInput(inputId = "y",
                    label = "Y-axis:",
                    choices = c("Total Strikeouts" = "total_SO", 
                                "Mean Batting Avg" = "mean_BA"),
                    selected = "total_SO")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("scatterplot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

