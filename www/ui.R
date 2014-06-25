shinyUI(pageWithSidebar(
  headerPanel("Publishing Analytics and Prediction Aid (PAPA)"),
  
  # SIDEBAR CONTENT
  sidebarPanel(
    tags$head(
      tags$style(type="text/css", "label.radio { display: inline-block; }", ".radio input[type=\"radio\"] { float: none; }"),
      tags$style(type="text/css", "select { max-width: 200px; }"),
      tags$style(type="text/css", "textarea { max-width: 185px; }"),
      tags$style(type="text/css", ".jslider { max-width: 200px; }"),
      tags$style(type='text/css', ".well { max-width: 310px; }"),
      tags$style(type='text/css', ".span4 { max-width: 310px; }")
    ),
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
    checkboxGroupInput('RD.indices','Measures to calculated',
                       choices=c("ARI"="ARI",
                                 "ARI (NRI)"="ARI.NRI",
                                 "ARI (simplified)"="ARI.simple",
                                 "Coleman-Liau"="Coleman.Liau",
                                 "Danielson-Bryan"="Danielson.Bryan",
                                 "Dickes-Steiwer"="Dickes.Steiwer",
                                 "ELF"="ELF",
                                 "Farr-Jenkins-Paterson"="Farr.Jenkins.Paterson",
                                 "Farr-Jenkins-Paterson (Powers-Sumner-Kearl)"="Farr.Jenkins.Paterson.PSK",
                                 "Flesch"="Flesch",
                                 "Flesch (Powers-Sumner-Kearl)"="Flesch.PSK",
                                 "Flesch (DE, Amstad)"="Flesch.de",
                                 "Flesch (ES, Fernandez-Huerta)"="Flesch.es",
                                 "Flesch (FR, Kandel-Moles)"="Flesch.fr",
                                 "Flesch (NL, Douma)"="Flesch.nl",
                                 "Flesch-Kincaid"="Flesch.Kincaid",
                                 "FOG"="FOG",
                                 "FOG (Powers-Sumner-Kearl)"="FOG.PSK",
                                 "FOG (NRI)"="FOG.NRI",
                                 "FORCAST"="FORCAST",
                                 "FORCAST (reading grade level)"="FORCAST.RGL",
                                 "Fucks Stilcharakteristik"="Fucks",
                                 "Linsear-Write"="Linsear.Write",
                                 "LIX"="LIX",
                                 "Neue Wiener Sachtextformeln"="nWS",
                                 "RIX"="RIX",
                                 "SMOG"="SMOG",
                                 "SMOG (DE, Bamberger-Vanecek)"="SMOG.de",
                                 "SMOG (formula C)"="SMOG.C",
                                 "SMOG (simplified)"="SMOG.simple",
                                 "Strain"="Strain",
                                 "TRI"="TRI",
                                 "Wheeler-Smith"="Wheeler.Smith",
                                 "Wheeler-Smith (DE, Bamberger-Vanecek)"="Wheeler.Smith.de"
                                 ),
                       selected=c("ARI",
                                  "ARI.NRI"
                                  )
                       )
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
               pre(dataTableOutput("desc.lttr.disrib")),
               h5("Word length (syllables)"),
               pre(dataTableOutput("syll.disrib")),
               pre(plotOutput("letter.plot"))
      ),
      # LEXICAL DIVERSITY
      tabPanel(title="Lexical diversity", value="TabLexdiv",
        h5("Summary"),
        pre(dataTableOutput("lexdiv.sum")),
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
      ),
      # Top Words
      tabPanel(title = "Top Words", value = 'TabTopWords',
               h5("Table of wordfrequency"),
               dataTableOutput("TopWords.tab")
      )
    ),

    # FOOTER DETAILS
    HTML("<hr noshade size='1'/>"),
    HTML("<div style='font-size:8pt; text-align:right; width:100%'>Created by Blaauw Data Intelligence</div>")
  )
  
  
))