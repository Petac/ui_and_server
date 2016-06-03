library(shiny)
library(ggplot2)

# Functions to evaluate
NewEgfr<-function(increa,insex,inage){
        if (insex=="Female" & increa>62)
                return(round(144*(increa/(0.7*88.4))^-1.209*0.993^inage))
        if(insex=="Female" & increa<63)
                return(round(144*(increa/(0.7*88.4))^-0.329*0.993^inage))
        if (insex=="Male" & increa>80)
                return(round(141*(increa/(0.9*88.4))^-1.209*0.993^inage))
        if (insex=="Male" & increa<81)
                return(round(141*(increa/(0.9*88.4))^-0.411*0.993^inage))
}
OldEgfr<-function(increa,insex,inage){
        if (insex=="Male")
                return(round(175*(increa/(88.4))^-1.154*inage^-0.203))
        if(insex=="Female")
                return(round(175*(increa/(88.4))^-1.154*inage^-0.203*0.742))
        }

shinyServer(
        function(input, output) {
                output$outegfrnew<-renderPrint({NewEgfr(input$increa,input$insex,input$inage)})
                output$outegfrold<-renderPrint({OldEgfr(input$increa,input$insex,input$inage)})        
                output$newvsold <- renderPlot({
                        input$goButton
                        isolate(barplot(height=c(NewEgfr(input$increa,input$insex,input$inage),
                                         OldEgfr(input$increa,input$insex,input$inage)),
                                        names.arg=c("New","Old"),
                                        space=0.5, width = c(0.5,0.5),col="red",
                                         ylab='eGFR value ml/min',
                                     main= 'New and Old eGFR formula evaluation \nReference interval >60 ml/min',
                                     sub="Formula"))
    
                })
        })        
        

