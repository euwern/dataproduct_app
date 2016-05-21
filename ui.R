library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("BMI Calculator"),
  
  sidebarPanel(
    
    sliderInput('height', 'Your height(cm)', min=1, max=300, step=1, value=173),
    sliderInput('weight', 'Your weight(kg)', min=1, max=150,
                value=78, step=1, round=0),
    h4(textOutput("text1")),
    h4(textOutput("text2")),
    h5('Tips:'),
    span('Slide height to your current height'),
    br(),
    span('Slide weight to to view your BMI')
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)