library(shiny)
library(shinydashboard)



sidebar <- dashboardSidebar(
  sidebarMenu(id = "tab",
              menuItem("1", tabName = "1")
  )
)
body <-   ## Body content
  dashboardBody(box(
    tableOutput("mytabs")))

ui <-   dashboardPage(dashboardHeader(title = "Scorecard"),
                      sidebar,
                      body)

# Define the server code
server <- function(input, output,session) {
  df <- data.frame(structure(list(`Mazda` = c(21000,20000,21500,24000), `Honda` = c(21500,20500,22000,24500)
                                  ,  Sales = c(2017,2015,2016,2014)
                                  ), class = "data.frame", row.names = c(NA, -4L)))


  output$mytabs<-renderTable({
    df
  })
}

shinyApp(ui = ui, server = server)
