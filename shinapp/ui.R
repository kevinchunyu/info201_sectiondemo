library("shiny")
library("rbokeh")
library("ggplot2")
library("dplyr")
library("plotly")

data <- read.csv("AMD.csv", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date)

ui <- fluidPage(

  navbarPage("AMD Historical Stock Price Data",
    tabPanel("Close", 
             # Side bar layout
             sidebarLayout(
               sidebarPanel(
                 # Allow user to input range
                 dateRangeInput("date_range", "Choose a date range:",
                                start = min(as.Date(data$Date)),
                                end = max(as.Date(data$Date)),
                                min = min(as.Date(data$Date)),
                                max = max(as.Date(data$Date)),
                                format = "yyyy/mm/dd",
                                separator = "-")
              ),
             # Main Panel
             mainPanel(
               # display Bokeh output
               rbokehOutput("close_price", width = "100%", height = "auto")
             ) 
            )),
    tabPanel("Volume Comparison Chart", 
             #Side Bar layout
             sidebarLayout(
               sidebarPanel(
                 # widget - selection for y axis with the following choices: open, high, low, close
                 selectInput("y_select", "Select variable:", 
                             choices = list("High" = "High", "Low" = "Low", "Close" = "Close"),
                             selected = "High")
               ),
               mainPanel(
                 # plotly output for chart
                 plotlyOutput("volume_comparison")
               )
             )
             ),
    tabPanel("Price Change Percentage (Daily)"),
    tabPanel("Volume Distribution")
  )
)