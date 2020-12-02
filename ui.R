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