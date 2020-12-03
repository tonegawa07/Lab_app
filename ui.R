shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        fileInput("rawdata", "Choose CSV File",
                  accept = c(
                    "text/csv",
                    "text/comma-separated-values,text/plain",
                    ".csv")
        ),
        numericInput("stdConc", "std conc. (ppm)", 10),
        numericInput("dil", "Dilution", 8),
        numericInput("extVol", "Extraction vol (mL)", 5),
        actionButton("submit", "OK"),
        downloadButton('downloadData', 'Download')
      ),
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("rawdata", tableOutput('rawdata')),
                    tabPanel("result", tableOutput("result"))
        )
      )
    )
  )
)