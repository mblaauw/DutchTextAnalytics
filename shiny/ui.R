library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Publishing Analytics and Prediction Aid (PAPA)"),
    
    sidebarPanel(
      tags$head(
        tags$style(type="text/css", "label.radio { display: inline-block; }", ".radio input[type=\"radio\"] { float: none; }"),
        tags$style(type="text/css", "select { max-width: 200px; }"),
        tags$style(type="text/css", "textarea { max-width: 185px; }"),
        tags$style(type="text/css", ".jslider { max-width: 200px; }"),
        tags$style(type='text/css', ".well { padding: 12px; margin-bottom: 5px; max-width: 280px; }"),
        tags$style(type='text/css', ".span4 { max-width: 280px; }")
      ),
      # limit the maximum amount of text to be analyzed
      includeHTML("./maxlength.html"),
      h4("Text to analyze:"),
    
      selectInput("text", "Book:", choices = c("../data/misc-nl/Anna Karenina - Leo Nikolaj Tolstoj.txt", 
                                               "../data/misc-nl/Orka in vrijheid.txt",
                                               "../data/misc-nl/Ben Hur - Lewis Wallace.txt",
                                               "../data/misc-nl/Avonturen van Don Quichot - Miguel de Cervantes Saavedra.txt")),
      conditionalPanel("input.tab == 'chkLexdiv'",
                       h4("Lexical diversity options:"),
                       numericInput("LD.segment", "MSTTR segment size:", 100),
                       sliderInput("LD.factor", "MTLD/MTLD-MA factor size:", min=0, max=1, value=0.72),
                       numericInput("LD.minTokens", "MTLD-MA min. tokens/factor:", 9),
                       numericInput("LD.random", "HD-D sample size:", 42),
                       numericInput("LD.window", "MATTR moving window:", 100),
                       checkboxInput("LD.caseSens", "Case sensitive", FALSE)
      ),
      conditionalPanel("input.tab == 'fldNgrams'",
                       h4("Ngrams input:"),
                       textInput(inputId="author",label="Keyword #1"),
                       textInput(inputId="title",label="Keyword #2")
      ),
      conditionalPanel("input.tab == 'chkReadability'",
                       h4("Readability options:"),
                       checkboxGroupInput("RD.indices", label="Measures to calculate",
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
                                                    "Wheeler-Smith (DE, Bamberger-Vanecek)"="Wheeler.Smith.de"),
                                          selected=c("ARI",
                                                     "Coleman-Liau",
                                                     "Danielson-Bryan",
                                                     "Dickes-Steiwer",
                                                     "ELF",
                                                     "Farr-Jenkins-Paterson",
                                                     "Flesch",
                                                     "Flesch-Kincaid",
                                                     "FOG",
                                                     "FORCAST",
                                                     "Fucks Stilcharakteristik",
                                                     "Linsear-Write",
                                                     "LIX",
                                                     "RIX",
                                                     "SMOG",
                                                     "Strain",
                                                     "Wheeler-Smith"))
      )
      #  		submitButton("Update View")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Language Detection",
                 h5("Detected Language"),
                 pre(textOutput("language.result"))
        ),
        tabPanel("Descriptive statistics",
                 tableOutput("desc"),
                 h5("Word length (letters)"),
                 tableOutput("desc.lttr.disrib"),
                 h5("Word length (syllables)"),
                 tableOutput("syll.disrib"),
                 plotOutput("letter.plot")
        ),
        tabPanel("Lexical diversity",
                 h5("Summary"),
                 tableOutput("lexdiv.sum"),
                 h5("Details"),
                 pre(textOutput("lexdiv.res")),
                 value="chkLexdiv"
        ),
        tabPanel("Readability",
                 h5("Summary"),
                 tableOutput("readability.sum"),
                 h5("Details"),
                 pre(textOutput("readability.res")),
                 value="chkReadability"
        ),
        tabPanel("Sentiment Detection",
                 h5("Sentiment Flow Detail"),
                 plotOutput("SentimentDectDetail.plot"),
                 value = "fldSentiment"
        ),
        tabPanel("Google N-Gram Check",
                 h5("Google N-Gram check for Author and Title"),
                 plotOutput("GoogleNgramCheck.plot"),
                 value = "fldNgrams"
        ),				
        tabPanel("Romance Detection.",
                 h5("Detection of romance thoughout the flow of the story"),
                 plotOutput("RomanceDect.plot"),
                 value = 'fldRomance'
        ),  
        id="tab"
      )
    )
  )
)
