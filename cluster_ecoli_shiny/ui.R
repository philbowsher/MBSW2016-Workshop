library(shiny)

shinyUI(fluidPage(
  theme = "~/ecoli_cluster_analysis/css/bootstrap.css",

  pageWithSidebar(
    h3("E.Coli Cluster Analysis", align = "center"),

    sidebarPanel(
      selectInput('xcol', 'Enter the attribute you want to display on X-axis of the plot :', names(ecoli)),
      conditionalPanel(
        condition = "input.xcol == 'mcg'",
        helpText("Description :"),
        helpText("McGeoch's method for signal sequence recognition.")
      ),
      conditionalPanel(
        condition = "input.xcol == 'gvh'",
        helpText("Description :"),
        helpText("von Heijne's method for signal sequence recognition.")
      ),
      conditionalPanel(
        condition = "input.xcol == 'aac'",
        helpText("Description :"),
        helpText(
          "Score of discriminant analysis of the amino acid content of outer membrane and periplasmic proteins."
        )
      ),
      conditionalPanel(
        condition = "input.xcol == 'alm1'",
        helpText("Description :"),
        helpText("Score of the ALOM membrane spanning region prediction program.")
      ),
      conditionalPanel(
        condition = "input.xcol == 'alm2'",
        helpText("Description :"),
        helpText(
          "Score of ALOM program after excluding putative cleavable signal regions from the sequence."
        )
      ),
      selectInput('ycol', 'Enter the attribute you want to display on Y-axis of the plot :', names(ecoli),
                  selected = names(ecoli)[[2]]),
      conditionalPanel(
        condition = "input.ycol == 'mcg'",
        helpText("Description :"),
        helpText("McGeoch's method for signal sequence recognition.")
      ),
      conditionalPanel(
        condition = "input.ycol == 'gvh'",
        helpText("Description :"),
        helpText("von Heijne's method for signal sequence recognition.")
      ),
      conditionalPanel(
        condition = "input.ycol == 'aac'",
        helpText("Description :"),
        helpText(
          "Score of discriminant analysis of the amino acid content of outer membrane and periplasmic proteins."
        )
      ),
      conditionalPanel(
        condition = "input.ycol == 'alm1'",
        helpText("Description :"),
        helpText("Score of the ALOM membrane spanning region prediction program.")
      ),
      conditionalPanel(
        condition = "input.ycol == 'alm2'",
        helpText("Description :"),
        helpText(
          "Score of ALOM program after excluding putative cleavable signal regions from the sequence."
        )
      ),
      sliderInput('clusters', 'Cluster Count', 3,
                  min = 1, max = 9)
    ),

    mainPanel(plotOutput('plot1'))
  )
))
