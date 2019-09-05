library(shiny)
library(clipr)
library(shinythemes)
unique_data <- NULL
# Define UI for application that take input and gives unique
ui <- fluidPage(
    #setting theme
    theme = shinytheme("cerulean"),
    # Application title
    titlePanel("Unique HBA Alias"),
    
    #file input
    fileInput(
        inputId = 'file_holder',
        label = 'Place File here',
        multiple = FALSE,
        buttonLabel = 'Submit',
        placeholder = 'Place txt file only',
        accept = c("text/comma-separated-values,text/plain",
                   "text/plain","text/csv")
    ),
    #sepration
    tags$hr(),
    #output
    mainPanel("Result",
        verbatimTextOutput("Values"),
        uiOutput("generate_download1"),
        uiOutput("generate_copy1")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$Values <- renderText({
        #file data
        inFile <- input$file_holder
        
        #validation
        if (is.null(inFile))
            return(NULL)
        
        #render UI
        output$generate_download1 <- renderUI(
            downloadButton(outputId = "download1",label = "Download as File")
        )
        output$generate_copy1 <- renderUI(
            actionButton(inputId = "copybutton1", "Copy!")
        )
        #extract and file
        data <- read.table(file = inFile$datapath,header = F,sep = ",",col.names = c("values"))
        unique_data <<- unique(data$values)
        paste(unique_data)
    })
    output$download1 <- downloadHandler(
        filename = "unique_values.txt",
        content = function(file){
            write.table(unique_data,file,quote = F,row.names = F,col.names = F)
            }
        ,contentType = "text/plain")
    observeEvent(input$copybutton1, {
        write_clip(content = unique_data,object_type = "auto",breaks = NULL,return_new = F)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
