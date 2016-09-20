library(shiny)
library(shinydashboard)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

ecoli = read.csv("~/MBSW2016-Workshop/clusterMBSW/data/ecoli.csv", header = F, sep = "")
ecoli = ecoli[-c(1,4,5,9)]
colnames(ecoli) = c("mcg", "gvh", "aac", "alm1", "alm2")

sidebar <- 
  
  dashboardSidebar( 
  
  sidebarMenu( menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")), 
               menuItem("Report", tabName = "report", icon = icon("file-text-o"), badgeLabel = "pdf/markdown"),
               menuItem("About", tabName = "about", icon = icon("info-circle"))
  )
               
               )


body <- dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            
              
            fluidRow(
              
              box(title = "X-axis Attribute", width = 4, solidHeader = TRUE, status = "primary",
                  collapsible = TRUE, selectInput('xcol', 'Enter the attribute you want to display on X-axis of the plot:', names(ecoli))),
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
              )),
            
            fluidRow(
              
              box(title = "Y-axis Attribute", width = 4, solidHeader = TRUE, status = "primary",
                  collapsible = TRUE, selectInput('ycol', 'Enter the attribute you want to display on Y-axis of the plot:', names(ecoli),
                          selected = names(ecoli)[[2]])),
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
              )
            ),
            
            fluidRow(
              box(title = "Select Number of Clusters", status = "warning", width = 6, solidHeader = TRUE,collapsible = TRUE,
                  sliderInput('clusters', 'Cluster Count', 3, min = 1, max = 9))),
            
            fluidRow(
              
              box(title='Cluster Escherichia coli (E. Coli) data based on 2 variables', status = "primary", width = 12, height = NULL, plotOutput('plot1')))
            
            
            ),
    
    tabItem(tabName = "report",
            h2("Here you can find a downloadable report on your data."),
            p("Note: under construction!")
    ),
    tabItem(tabName = "about",
            h3("About Section"),
            p("Ecoli Dashboard is a visual dashboard for cluster analysis. For now it supports Ecoli data, but other data sets to be considered down the road. For more information visit the Github repository."))
  )
    )


ui <- dashboardPage(dashboardHeader(title = 'Ecoli Cluster Analysis'), sidebar,body)

server <- shinyServer(function(input, output, session) {
  
  selectedData <- reactive({
    ecoli[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
})

shinyApp(ui = ui, server = server)