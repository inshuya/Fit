library(shiny)
library(dygraphs)
library(xts)

# Load data ----
pacman::p_load(pacman, party, psych, rio, tidyverse)
fit_data <- read.csv("D:/R/Fit/data/Fit.csv", na.strings = "null")
fit_data$Date <- as.Date(fit_data$Date, "%d-%m-%Y")

# Daily data ----
data_xts <-  as.xts(fit_data$Step.count, order.by = fit_data$Date)
Active_Minutes <-  as.xts(fit_data$Active.Minutes, order.by = fit_data$Date)
Inactive_Minutes <-  as.xts(fit_data$Inactive.Minutes, order.by = fit_data$Date)
data_xts_aim <- cbind(Active_Minutes, Inactive_Minutes)

# Monthly data ----
data_xts_month <- apply.monthly(as.xts(data_xts),FUN=mean)
Active_Minutes_month <- apply.monthly(as.xts(Active_Minutes),FUN=mean)
Inactive_Minutes_month <- apply.monthly(as.xts(Inactive_Minutes),FUN=mean)
data_xts_aim_month <- cbind(Active_Minutes_month, Inactive_Minutes_month)

# Server logic required to draw the timeline ----
server <- function(input, output) {
  
  # Output Graph ----
  output$all <- renderDygraph({
   dygraph(data(), main = title(), 
           ylab = label())  %>% 
      dyRangeSelector(dateWindow = daterange()) %>%
      dyEvent("2017-07-31", "Joined Visa", labelLoc = "bottom") %>%
      dyEvent("2018-10-31", "Began Applying to Schools", labelLoc = "bottom") %>%
      dyEvent("2019-01-31", "Texas A&M said YES!", labelLoc = "bottom") %>%
      dyEvent("2019-08-31", "Reached Aggieland", labelLoc = "bottom") %>%
      dyEvent("2019-10-31", "Internship Search Begins", labelLoc = "bottom") %>%
      dyEvent("2020-01-31", "Google said YES!", labelLoc = "bottom") %>%
      dyEvent("2020-03-31", "Pandemic", labelLoc = "bottom") %>%
      dyEvent("2020-06-01", "Internship begins", labelLoc = "bottom") %>%
      dyOptions(fillGraph = TRUE) %>%
      dyLegend(width = 400)
    
  })

  # Input Date Range ----
  daterange <- eventReactive(input$go, {
     input$dateRange+1
  })
  
  # Input Data ----
  data <- eventReactive(input$go, {
    if(input$cadence == "Daily" & input$measure == "Steps")
    {
      data_xts
    }
    else if (input$cadence == "Monthly" & input$measure == "Steps")
    {
      data_xts_month
    }
    else if (input$cadence == "Daily" & input$measure == "Active/Inactive Minutes")
    {
      data_xts_aim
    }
    else
    {
      data_xts_aim_month
    }
    
  })
  
  # Input Title ----
  title <- eventReactive(input$go, {
    if(input$cadence == "Daily" & input$measure == "Steps")
    {
      "Daily Step Count"
    }
    else if (input$cadence == "Monthly" & input$measure == "Steps")
    {
      "Monthly Step Count"
    }
    else if (input$cadence == "Daily" & input$measure == "Active/Inactive Minutes")
    {
      "Daily Active/Inactive Minutes"
    }
    else
    {
      "Monthly Active/Inactive Minutes"
    }
    
  })
  
  # Input Label ----
  label <- eventReactive(input$go, {
    if(input$cadence == "Daily" & input$measure == "Steps")
    {
      "Step Count"
    }
    else if (input$cadence == "Monthly" & input$measure == "Steps")
    {
      "Average Step Count"
    }
    else if (input$cadence == "Daily" & input$measure == "Active/Inactive Minutes")
    {
      "Active/Inactive Minutes"
    }
    else
    {
      "Average Active/Inactive Minutes"
    }
    
  })
  
}