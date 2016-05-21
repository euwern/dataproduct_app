library(shiny)
library(ggplot2)

function(input, output) {
  #http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/
  weight_list = seq(1, 150)
  bmi_list <-reactive({weight_list/(input$height/100)^2})
  
  output$plot <- renderPlot({
    weight = weight_list
    bmi = bmi_list()
    
    curr_weight = input$weight
    plot(weight, bmi, type="h")
    
    curr_bmi = round(curr_weight/(input$height/100)^2,1)
    
    health_str = ''
    color_str = ''
    if (curr_bmi < 18.5) {
      health_str = 'Underweight'
      color_str = 'red'
    } else if (curr_bmi >= 18.5 & curr_bmi < 24.9) {
      health_str = 'Normal or Healthy Weight'
      color_str = 'green'
    } else if (curr_bmi >= 25 & curr_bmi < 29.9) {
      health_str = 'Overweight'
      color_str = 'yellow'
    } else {
      health_str = 'Obese'
      color_str = 'red'
    }
    lines(c(curr_weight, curr_weight), c(0, 20000000),col=color_str,lwd=5)
    
    output$text1 <- renderText({paste("Your BMI is", toString(curr_bmi))})
    output$text2 <- renderText({paste("You are ", health_str)})
  }, height=600)
  
}