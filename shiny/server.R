library(shiny)
library(koRpus)
library(ggplot2)
library(reshape2)

shinyServer(function(input, output){

  # Language Detection
  language.result <- reactive ({
    library(textcat)
    textcat(substr(readChar(input$text, file.info(input$text)$size),1,10000))   
    
  })
  # Ouput language detection
  output$language.result <- renderPrint({
    language.result()          
  })
  
  
  # Tag the text  
  tagged.text <- reactive({
    tokenize(substr(readChar(input$text, file.info(input$text)$size),1,10000), format="obj", lang='en')
  })
  
  # Hypenate the text
  hyphenated.text <- reactive({
    # set the next line to activate caching, if this application is run on a shiny server
    #set.kRp.env(hyph.cache.file=file.path("/var","shiny-server","cache","koRpus",paste("hyph.cache.",input$lang,".rdata", sep="")))
    hyphen(tagged.text(), quiet=TRUE)
  })
  
  # Descriptive Statistics Tab functionality
  output$letter.plot <- renderPlot(plot(tagged.text(), what="letters"))
  output$desc <- renderTable({
    basic.desc.data <- as.data.frame(describe(tagged.text())[c("all.chars","normalized.space","chars.no.space", "letters.only","lines",
                                                               "punct","digits","words","sentences","avg.sentc.length","avg.word.length")])
    syll.desc.data <- as.data.frame(describe(hyphenated.text())[c("num.syll", "avg.syll.word")])
    colnames(basic.desc.data) <- c("All characters","Normalized space","Characters (no space)", "Characters (letters only)","Lines",
                                   "Punctuation","Digits","Words","Sentences","Avg. sentence length","Avg. word length")
    colnames(syll.desc.data) <- c("Syllables", "Avg. syllable per word")
    desc.data <- cbind(basic.desc.data, syll.desc.data)
    rownames(desc.data) <- c("Value")
    t(desc.data)
  })
  output$desc.lttr.disrib <- renderTable({
    t(describe(tagged.text())[["lttr.distrib"]])
  })
  output$syll.disrib <- renderTable({
    t(describe(hyphenated.text())[["syll.distrib"]])
  })
  
  # Lexical Diversity Tab functionality
  LD.results <- reactive(lex.div(tagged.text(), segment=input$LD.segment, factor.size=input$LD.factor, min.tokens=input$LD.minTokens,
                                 rand.sample=input$LD.random, window=input$LD.window, case.sens=input$LD.caseSens, detailed=FALSE, char=c(), quiet=TRUE))
  output$lexdiv.sum <- renderTable({
    summary(LD.results())
  })
  output$lexdiv.res <- renderPrint({
    LD.results()
  })
  
  # Readability Tab functionality
  RD.results <- reactive(readability(tagged.text(), hyphen=hyphenated.text(), index=input$RD.indices, quiet=TRUE))
  output$readability.sum <- renderTable({
    summary(RD.results())
  })
  output$readability.res <- renderPrint({
    RD.results()
  })
  
  # Sentiment Tab functionality
  SentimentDect.results <- reactive({
    library(ggplot2)
    library(reshape2)

    sentiment.file <- "../data/NL_AFINN-111.txt"
    book.label <- input$text
    
    # LOAD Sentiment words to matrix
    df.sentiments <- read.table(sentiment.file,header=F,sep="\t",quote="",col.names=c("term","score"))
    df.sentiments$term <- gsub("[^[:alnum:]]", " ",df.sentiments$term)
    
    # Build Scoring functions
    ScoreTerm <- function(term){
      df.sentiments[match(term,df.sentiments[,"term"]),"score"]
    }
    ScoreText <- function(text){
      text <- tolower(gsub("[^[:alnum:]]", " ",text))
      text <- do.call(c,strsplit(text," "))
      text <- text[text!=""]
      scores <- ScoreTerm(text)
      scores[is.na(scores)] <- 0
      scores
    }
    RollUpScores <-function(scores, parts=100){
      batch.size <- length(scores)/parts
      
      s <- sapply(seq(batch.size/2, length(scores) - batch.size/2, batch.size), function(x){
        low  <- x - (batch.size/2)
        high <- x + (batch.size/2)
        mean(scores[low:high])
      })
      s
    }
    
    # reshape scores 
    scores <- ScoreText(readChar(input$text, file.info(input$text)$size))
    percent.scores <- as.data.frame(RollUpScores(scores))
    colnames(percent.scores)<-book.label
    percent.scores$percent <- 1:nrow(percent.scores)
    escores <- melt(percent.scores,"percent",book.label,variable.name="book",value.name="sentiment")
    escores
    
  })
  output$SentimentDectDetail.plot <- renderPlot({
    # Create base plot
    plot.sentiment<- ggplot(SentimentDect.results(), aes(x = percent, y = sentiment, color='red'))
    
    # detail plot
    print(plot.sentiment + geom_point() + stat_smooth(method="loess",span=0.5) + geom_hline() + facet_grid(book ~.) + theme(legend.position="none"))
  })
  
  # Google NGram Check
  output$GoogleNgramCheck.plot <- renderPlot({
    library(ngramr)
    require(ggplot2)
    print(ggram(c(input$author, input$title), year_start = 1980, ignore_case=FALSE, geom="line"))
  }) 
  
  
  # Romance Tab functionality
  RomanceDect.results <- reactive({
    library(ggplot2)
    library(reshape2)
    
    word.file <- "/Users/mblaauw/Downloads/06_P_PROJECTS/py-text-stat/data/wordlists/NL_Romance.txt"
    book.label <- input$text
    
    # LOAD resulting words to matrix
    df.words  <- read.table(word.file, header=F, sep="\t", quote="", col.names=c("term","score"))
    df.words$term <- gsub("[^[:alnum:]]", " ",df.words$term)
    
    # Build Scoring functions
    ScoreTerm <- function(term){
      df.words[match(term,df.words[,"term"]),"score"]
    }
    ScoreText <- function(text){
      text <- tolower(gsub("[^[:alnum:]]", " ",text))
      text <- do.call(c,strsplit(text," "))
      text <- text[text!=""]
      scores <- ScoreTerm(text)
      scores[is.na(scores)] <- 0
      scores
    }
    RollUpScores <-function(scores, parts=100){
      batch.size <- length(scores)/parts
      
      s <- sapply(seq(batch.size/2, length(scores) - batch.size/2, batch.size), function(x){
        low  <- x - (batch.size/2)
        high <- x + (batch.size/2)
        mean(scores[low:high])
      })
      s
    }
    
    # reshape scores 
    scores <- ScoreText(readChar(input$text, file.info(input$text)$size))
    percent.scores <- as.data.frame(RollUpScores(scores))
    colnames(percent.scores)<-book.label
    percent.scores$percent <- 1:nrow(percent.scores)
    escores <- melt(percent.scores,"percent",book.label,variable.name="book",value.name="sentiment")
    escores
    
  })
  output$RomanceDect.plot <- renderPlot({
    # Create base plot
    plot.words<- ggplot(RomanceDect.results(), aes(x = percent, y = sentiment, color='red'))
    
    # detail plot
    print(plot.words + geom_point() + stat_smooth(method="loess",span=0.5) + geom_hline() + facet_grid(book ~.) + theme(legend.position="none"))
  })
 
})
