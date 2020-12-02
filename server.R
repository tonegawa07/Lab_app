server = function(input, output, session) {
  observeEvent(input$rawdata, {
    
    csv_file = reactive(read.csv(input$rawdata$datapath))
    output$rawdata = renderTable(csv_file())
    result_csv = reactive(cal_hplc(std_conc = 10, Dil = 8, Ext_vol = 5, data = csv_file()))
    output$result = renderTable(result_csv())
    
    output$downloadData = downloadHandler(
    filename = reactive(paste0("Result_", input$rawdata$name)),
    content = function(file) {
        
        write.csv(result_csv(), file)
    })
  })
}