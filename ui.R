library(shiny)

shinyUI(
  fluidPage(
    titlePanel(h1("Histgram Generator")),
    
    sidebarLayout(
      sidebarPanel(
        fileInput("file1", label=h3("Choose CSV File"),
                  multiple = TRUE,
                  accept = c("text/csv",
                             "text/comma-separated-values,text/plain",
                             ".csv")),
        
        textInput("col", label=h3("Choose Column name")),
        
        sliderInput("breaks", label=h3("Breaks"),
                    min = 1, max = 50, value = 10)
        
      ),
      
      mainPanel(
        h1("Data Set", align = "center"),
        tableOutput("table"),
        plotOutput(("histgram"))
        )
    )
  )
)
