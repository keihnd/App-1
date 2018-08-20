library(shiny)

shinyServer(function(input, output){
  
  output$table = renderTable({

    inFile = input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      read.csv(inFile$datapath, header = TRUE)
    }
  })
  
  
  output$histgram = renderPlot({
    inFile = input$file1

    if (is.null(inFile)){
      return(NULL)
    }else{
      inData = read.csv(inFile$datapath, header = TRUE)
      col.hist = input$col
      col.name= colnames(inData)
      for(i in 1:length(col.name)){
        if(col.hist == col.name[i]){
          hist(inData[,col.hist],
               breaks=input$breaks)
        }
      }
    }
  })
  
}
)