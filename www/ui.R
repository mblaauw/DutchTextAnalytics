shinyUI(pageWithSidebar(
  headerPanel("Publishing Analytics and Prediction Aid (PAPA)"),
  
  # SIDEBAR CONTENT
  sidebarPanel(width='2',
    h4("Book to analyze:"),
    selectInput("text", "", 
                choices = c("../data/misc-nl/Anna Karenina - Leo Nikolaj Tolstoj.txt",
                            "../data/misc-nl/Orka in vrijheid.txt",
                            "../data/misc-nl/Ben Hur - Lewis Wallace.txt",
                            "../data/misc-nl/Avonturen van Don Quichot - Miguel de Cervantes Saavedra.txt")
  ),    
  conditionalPanel(
    condition = "input.tab == 'TabLexdiv'",
    h4("Lexical diversity options:"),
    numericInput("LD.segment", "MSTTR segment size:", 100),
    sliderInput("LD.factor", "MTLD/MTLD-MA factor size:", min=0, max=1, value=0.72),
    numericInput("LD.minTokens", "MTLD-MA min. tokens/factor:", 9),
    numericInput("LD.random", "HD-D sample size:", 42),
    numericInput("LD.window", "MATTR moving window:", 100),
    checkboxInput("LD.caseSens", "Case sensitive", FALSE)
  ),
  conditionalPanel(
    condition = "input.tab == 'TabReadability'",
    h4("Readability options:"),
    checkboxGroupInput('RD.indices','Measures to calculated')
  ),
  conditionalPanel(
    condition = "input.tab == 'TabNgrams'",
    h4("Ngrams input:"),
    textInput(inputId="author",label="Keyword #1"),
    textInput(inputId="title",label="Keyword #2")
  )
  
  ),  
  
  # BODY CONTENT
  mainPanel(
    tabsetPanel(id='tab',
      # LANGUAGE DETECTION
      tabPanel(title = "Language Detection", value = "TabLangDect",
               h5("Detected Language"),
               pre(textOutput("language.result"))
      ),
      # DESCRIPTIVE STATISTICS
      tabPanel(title = "Descriptive statistics", value = "TabDescStat",
               tableOutput("desc"),
               h5("Word length (letters)"),
               tableOutput("desc.lttr.disrib"),
               h5("Word length (syllables)"),
               tableOutput("syll.disrib"),
               plotOutput("letter.plot")
      ),
      # LEXICAL DIVERSITY
      tabPanel(title="Lexical diversity", value="TabLexdiv",
        h5("Summary"),
        tableOutput("lexdiv.sum"),
        h5("Details"),
        pre(textOutput("lexdiv.res"))
      ),
      # READABILITY
      tabPanel(title = "Readability", value="TabReadability",
        h5("Summary"),
        pre(dataTableOutput("readability.sum")),
        h5("Details"),
        pre(textOutput("readability.res"))
      ),
      # SENTIMENT DETECTION
      tabPanel(title = "Sentiment Detection", value = "TabSentiment",
        h5("Sentiment Flow Detail"),
        pre(plotOutput("SentimentDectDetail.plot"))
      ),
      # GOOGLE N-GRAM CHECK
      tabPanel(title = "Google N-Gram Check", value = "TabNgrams",
        h5("Google N-Gram check for Author and Title"),
        plotOutput("GoogleNgramCheck.plot")
      ),  		
      # ROMANCE KEYWORD DETECTION
      tabPanel(title = "Romance Detection.", value = 'TabRomance',
        h5("Detection of romance thoughout the flow of the story"),
        plotOutput("RomanceDect.plot")
      )
    ),

    # FOOTER DETAILS
    HTML("<hr noshade size='1'/>"),
    HTML("<div style='font-size:8pt; text-align:right; width:100%'>Updates hourly. See <a href='https://gist.github.com/hrbrmstr/8949172'>this gist</a> and <a href='http://rud.is/b/2014/02/11/live-google-spreadsheet-for-keeping-track-of-sochi-medals/'>this blog post</a> for more info.<br/>Shiny hosting provided by <a href='http://dds.ec/'>Data Driven Security</a></div>")
  )
  
  
))