library(shiny)

# Define UI for application that draws a dotplot
shinyUI(pageWithSidebar(
        headerPanel("New formula for eGFR calculation"),
        sidebarPanel(
                h3('Documentation'),
                h4('A laboratory changes the formula used to calculate eGFR.
                   This App compares the eGFR output from the old formula to the new formula.
                   eGFR is calculated based on sex, age, and creatinine level.
                   Use the three input boxes to set your sex, age, and creatinine level.
                   Press the (Show plot) to see a graphical output.
                   The new formula estimates better at the extremes'),
                h3('Input'),
                numericInput('inage', 'Your age', 18, min = 18, max = 120, step = 1),
                numericInput('increa', 'Your creatinine level', 60, min = 4, max = 2300, step = 1),
                selectInput('insex','Your sex',c("Male","Female"), selected="Female",selectize = FALSE),
                actionButton("goButton", "Show plot")
                ),

    # Show plot of the generated values
    mainPanel(
            h3('Comparing your eGFR results'),
            h4('Your eGFR with the new formula is:'),
            verbatimTextOutput("outegfrnew"),
            h4('Your eGFR with the old formula is:'),
            verbatimTextOutput("outegfrold"),
            plotOutput('newvsold')
  )
))
