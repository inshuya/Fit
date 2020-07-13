library(shiny)
library(shinythemes)

# Define UI for Inshuya's Journey ----
ui <- fluidPage(
  theme = shinytheme("yeti"),
  
  # App title ----
  titlePanel("Inshuya's Journey"),
  
  # Sidebar layout with input definitions ----
  sidebarLayout(
    sidebarPanel(
      selectInput("cadence", label = "Cadence",
                  choices = list("Daily", "Monthly")),
      selectInput("measure", label = "Measure",
                  choices = list("Steps", "Active/Inactive Minutes")), 
      width = 3,
      dateRangeInput("dateRange", "Date Range", start = "2017-06-01", end =
      "2020-06-30", min = NULL, max = NULL, format = "yyyy-mm-dd", startview =
      "month", weekstart = 0, language = "en", separator = " to ", width =
      NULL, autoclose = TRUE),
      actionButton(inputId = "go", label = "Go!")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      dygraphOutput("all")
    )
  )
)