library(tm)
library(koRpus)
#library(tau)
library(textir)

txt.file_02 <- readLines('/03_P-PROJECTS/CollectDutchBookFeatures/data/nl_books/Anna Karenina - Leo Nikolaj Tolstoj.txt',encoding='UTF-8')
txt.file_01 <- readLines('/03_P-PROJECTS/CollectDutchBookFeatures/data/nl_books/Orka in vrijheid.txt',encoding='UTF-8')

tagged.text_01 <- tokenize(txt.file_01, format='obj', lang='en')
hyphenated.text_01 <- hyphen(tagged.text_01)

tagged.text_02 <- tokenize(txt.file_02, format='obj', lang='en')
hyphenated.text_02 <- hyphen(tagged.text_02)

plot(tagged.text_01, what="letters")
plot(tagged.text_02, what="letters")

  # set the next line to activate caching, if this application is run on a shiny server
  #set.kRp.env(hyph.cache.file=file.path("/var","shiny-server","cache","koRpus",paste("hyph.cache.",input$lang,".rdata", sep="")))
  


basic.desc.data <- as.data.frame(describe(tagged.text)[c("all.chars","normalized.space","chars.no.space", "letters.only","lines",
                                                           "punct","digits","words","sentences","avg.sentc.length","avg.word.length")])

syll.desc.data <- as.data.frame(describe(hyphenated.text)[c("num.syll", "avg.syll.word")])

colnames(basic.desc.data) <- c("All characters","Normalized space","Characters (no space)", "Characters (letters only)","Lines",
                               "Punctuation","Digits","Words","Sentences","Avg. sentence length","Avg. word length")

colnames(syll.desc.data) <- c("Syllables", "Avg. syllable per word")

desc.data <- cbind(basic.desc.data, syll.desc.data)

rownames(desc.data) <- c("Value")

t(desc.data)

t(tagged.text@desc$lttr.distrib)


t(hyphenated.text@desc$syll.distrib)

LD.results <- lex.div(tagged.text, segment=input$LD.segment, factor.size=input$LD.factor, min.tokens=input$LD.minTokens,
                               rand.sample=input$LD.random, window=input$LD.window, case.sens=input$LD.caseSens, detailed=FALSE, char=c(), quiet=TRUE)

summary(LD.results)

LD.results()

RD.results = readability(tagged.text, hyphen=hyphenated.text, index=1, quiet=TRUE)

summary(RD.results)

RD.results

langDect.results <- guess.lang(input$text, udhr.path="/var/shiny-server/www/koRpus/udhr_txt", format="obj")

summary(langDect.results


