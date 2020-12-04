shinyUI(
  fluidPage(
    dashboardPage(skin = "green",
      dashboardHeader(title = "Lab App"),
      dashboardSidebar(
        sidebarMenu(
        menuItem("Calculation of HPLC data", tabName = "cal_hplc"),
        menuItem("Statistical tests", tabName = "stat_test")
        )
      ),
      dashboardBody(

        tabItems(
          tabItem(tabName = "cal_hplc",
          
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
                            tabPanel("rawdata", DT::dataTableOutput('rawdata')),
                            tabPanel("std plot", plotOutput("stdPlot", width = 500)),
                            tabPanel("result", DT::dataTableOutput("result"))
                )
              )
            )
          
          ),
          tabItem(tabName = "stat_test",
            box(
              title = "Coming soon"
            )
          )
        )

      )
    ),
    tags$footer(
      tags$p("© 2020 Yusuke Fukuda")
    ),
    includeCSS("./css/style.css")
  )
)