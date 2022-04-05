library("shiny")
library("rbokeh")
library("ggplot2")
library("dplyr")
library("plotly")

data <- read.csv("AMD.csv", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date)

server <- function(input, output) {
  
  # Historical Closing price of AMD
  output$close_price <- renderRbokeh({
    # data wrangling depending on user input
    data_range <- data %>% filter(data$Date >= as.Date(input$date_range[1]) & data$Date <= as.Date(input$date_range[2])) 
    
    # Validating user input
    validate(
      need(nrow(data_range) > 1 , "Enter valid date.")
    )
    
    figure(title = "AMD Closing Price") %>%
      ly_lines(as.Date(data_range$Date), data_range$Close, data = data_range, color = "#65C18C") %>% 
      x_axis(label = "Date") %>% 
      y_axis(label = "Close Price")
  })
  
  # Volume Comparison Chart -- plotly
  output$volume_comparison <- renderPlotly({
    ## create plotly chart for volume vs user selected variable
    
    # data wrangling depending on user input, preparing dataframe for graphing
    data_volume <- data %>% select(input$y_select, Volume) %>% rename("yval" = input$y_select)
    # plot_ly output and graphing
    plot_ly(data = data_volume, x = ~Volume, y = ~yval)
    
  })
}
