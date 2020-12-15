ui_tw_anova = 
  sidebarLayout(
    sidebarPanel(
      fileInput("tw_anova_rawdata", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      downloadButton('tw_anova_downloadData', 'Download')
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("rawdata", DT::dataTableOutput('tw_anova_rawdata')),
                  tabPanel("Two-way ANOVA table ", DT::dataTableOutput('tw_anova_table_result'))
      )
    )
  )