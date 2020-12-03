server = function(input, output, session) {
  # csvがupされたら動く
  observeEvent(input$rawdata, {
    
    # csv_fileにupしたcsvを代入
    csv_file = reactive(read.csv(input$rawdata$datapath))
    output$rawdata = DT::renderDataTable(csv_file(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))

    # OKボタンを押したら動く
    observeEvent(input$submit, {

      stdConc = input$stdConc
      dil         = input$dil
      extVol = input$extVol

      # result_csvに計算後のcsvを代入
      result_csv = reactive(cal_hplc(std_conc = stdConc, Dil = dil, Ext_vol = extVol, data = csv_file()))
      # resultタブに結果を表示
      output$result = DT::renderDataTable(result_csv(), options = list(pageLength = 100, scrollX = TRUE, scrollY = TRUE, scrollCollapse = TRUE))
      
      output$downloadData = downloadHandler(
      filename = reactive(paste0("Result_", input$rawdata$name)),
      content = function(file) {
          
          write.csv(result_csv(), file)
      })
    })
  })
}