library(qdap)

text  = "Sachs pakte een zaklamp en het sporenkoffertje en liep de aflopende ingang van de garage in.
  		Ze keek naar de grond. Vreemd.
			Rhyme zag het ook. ‘Wat is dat allemaal, Sachs?’
‘Afval.’ Het was een enorme troep bij de ingang. Vlakbij lag een afvalcontainer op zijn kant en de tientallen vuilniszakken die erin hadden gezeten waren eruit gehaald en opengescheurd. De inhoud lag overal verspreid.
Het was één grote rotzooi.
‘Ik kan je bijna niet verstaan, Sachs.’ 
‘Ik draag een n-vijfennegentig.’
‘Chemisch, biologisch?’
‘De eerste politieman ter plaatse raadde het me aan.’
‘Wat is het donker,’ mopperde de criminalist tenslotte.
De videocamera paste zich automatisch aan de hoeveelheid licht aan, en op het beeldscherm was nu waarschijnlijk de groenige tint zichtbaar die bekend was uit spionagefilms en reality-series, maar er waren grenzen aan wat er via bits en bytes overgebracht kon worden.
En via de ogen ook, trouwens. Het was echt donker. De lampen waren weg, zag ze. Ze bleef staan.
‘Wat is er?’ vroeg hij.
‘De lampen zijn er niet alleen uit gehaald, Rhyme, ze zijn ook kapotgeslagen. De scherven liggen op de grond.’
‘Als de dader daarachter zit, wil dat waarschijnlijk zeggen dat hij niet in het gebouw woont. Hij wist niet waar de schakelaar zat en had geen tijd om die te zoeken.’
Net iets voor Rhyme om een dergelijke conclusie te trekken uit een enkele, schijnbaar onbeduidende observatie.
‘Maar waarom zou hij ze kapotslaan?’
‘Misschien is hij gewoon voorzichtig. Het is moeilijk om vingerafdrukken of andere sporen van een kapotgeslagen gloeilamp te halen. Hm, het zou een slim iemand kunnen zijn.’
Sachs hoorde tot haar voldoening dat hij in een goede bui was. De operatie – gecompliceerd, duur en behoorlijk riskant – was prima verlopen. Tot op zekere hoogte kon hij beide armen en handen weer bewegen. Hij had er geen gevoel in; niets kon dat terugbrengen, in ieder geval was de medische wetenschap nu nog niet zo ver, maar hij was veel minder afhankelijk dan vroeger en dat betekende alles voor iemand als Lincoln Rhyme.
Uiteindelijk nam ze haar toevlucht tot haar zaklamp. Ze klikte de lange Maglite aan en liep langs een tiental geparkeerde auto’s. Sommige lieden zouden ongetwijfeld woedend zijn omdat ze vanwege een futiliteit als een moord hun auto niet mochten gebruiken. Aan de andere kant zouden er beslist talloze mensen bereid zijn de politie te helpen met het pakken van de dader.
Nergens leerde je meer over de menselijke natuur dan bij de politie.
Sachs voelde een steek in haar knie, een gevolg van artrose, en ging langzamer lopen. Even later bleef ze helemaal staan, niet vanwege de pijn in haar gewrichten, maar omdat ze iets hoorde. Gekraak en getik. Er ging een deur dicht – een binnendeur, geen autoportier. Het leek ver weg, maar ze kon het niet met zekerheid zeggen. De muren dempten en weerkaatsten geluiden.
Voetstappen?
Ze draaide zich snel om en had bijna haar Glock gepakt.
Nee, alleen maar druppelend water, uit een buis. Het water sijpelde langs de schuine inrit omlaag en vermengde zich met het papier en het andere afval op de grond; hier lag nog meer troep.
‘Oké, Rhyme,’ zei ze. ‘Ik ben bijna op het laagste niveau. Het slachtoffer en de auto bevinden zich om de hoek.’
‘Ga verder, Sachs.’
Ze besefte dat ze was blijven staan. Ze voelde zich niet op haar gemak. ‘Ik kan al dat afval niet plaatsen.’
Sachs zette zich weer in beweging en ging langzaam op de hoek af. Daar bleef ze weer staan, zette het koffertje neer en trok haar pistool. In het licht van de zaklamp zag ze een vage nevel. Ze tilde het masker op, snoof en hoestte. Er hing een scherpe geur. Van verf misschien, of andere chemicaliën. En rook. Ze zag waar die vandaan kwam. In de hoek smeulden wat kranten.
Daar had Marko het over gehad.
‘Oké, ik betreed de plaats delict, Rhyme.’
Ze dacht aan de woorden van Marko.
Zoiets ergs…
Met haar wapen in de aanslag ging ze de hoek om en richtte de krachtige, brede lichtbundel van de zaklamp op de plek waar het slachtoffer en haar auto zich bevonden.
Sachs’ adem stokte. ‘O, jezus, Rhyme. O, nee…’







Een_zaak_volgens_het_boekje_epub-7.xhtml






2
Om vier uur stapte Amelia Sachs het huis van Lincoln Rhyme in Central Park West binnen.
Ze kreeg meteen een felle blik van Rhyme, niet alleen vanwege het felle herfstlicht dat door de open deur achter haar naar binnen viel, maar ook omdat zijn geduld op was.
Het had ontzettend lang geduurd voordat ze klaar waren met het forensisch onderzoek ter plaatse, zesenhalf uur om precies te zijn. Hij kon zich niet heugen dat een onderzoek op één plaats delict ooit zoveel tijd in beslag had genomen.
Sachs had hem verteld dat de jonge rechercheur die als eerste poolshoogte was gaan nemen had gezegd dat hij nog nooit zoiets ergs had gezien. Daarmee bedoelde hij niet alleen dat het slachtoffer een vreselijke, sadistische dood was gestorven, maar ook dat de plaats delict op onvoorstelbare wijze vervuild was.
‘Ik heb nog nooit zoiets bizars gezien,’ had Rhyme via de microfoon van Sachs te horen gekregen. Afgaand op wat hij op het hd-scherm zag, moest hij toegeven dat ook hij er versteld van stond. Elke vierkante centimeter van de plaats delict – van de ingang tot de vloer van de garage en de auto van het slachtoffer – was bedekt met een laag afval, dat geverfd, bepoederd en met vloeistoffen besprenkeld was.
"

# Word lists

abbreviations # Small Abbreviations Data Set
action.verbs  # Action Word List
adverb        # Adverb Word List
increase.amplification.words  # Amplifying Words

action.verbs  # Action Word List
contractions  # Contraction Conversions
emoticon      # Emoticons Data Set
NAMES         # First Names and Gender (U.S.)
NAMES_SEX     # First Names and Predictive Gender (U.S.)
NAMES_LIST    # First Names and Predictive Gender (U.S.) List


v_pos_words   = data(positive.words)
v_neg_words   = data(negative.words)
v_bagofwords  = bag.o.words(text)
v_stopwords   = tm::stopwords("english")
v_wordstats   = word_stats(text, apostrophe.remove=TRUE, parallel=TRUE,digit.remove=TRUE)

v_termco      = termco(text,match.list=action.verbs)

outlier.detect(text, FUN=syllable.sum)


v_ngrams      = ngrams(text, seq_along(text), 3)
v_allwords    = all_words(text)
v_wordlist    = word_list(text, stopwords=v_stopwords)

v_pos         = pos(v_wordlist, digits=3)

v_ngrams$group_n



v_wordlist    = word_list(text, stopwords=v_stopwords, grouping.var=NAMES_SEX$name)

library(tau)
x = textcnt(text, method="ngram", n=3L)

x = sapply(text, textcnt, method = "ngram")



# wfdf(text,stopwords=v_stopwords)



word_diff_list(v_allwords, grouping.var=action.verbs, stopwords=v_stopwords)

v_ngrams$group_n$'row 1'$n_3


library(qdap)



## NGRAMR 
library(ngramr)
ggram(c("Dan Brown"), year_start = 2000, ignore_case=FALSE)
ggram(c("Dan Brown"), year_start = 1980, ignore_case=FALSE, geom="line", google_theme=TRUE)



require(ggplot2)
ggram(c("dan brown"),
      year_start = 1900,
      corpus = "fre_2012",
      geom = "step")




freq <- ngram(, year_start = 1950)
head(freq)


freq  = ngram(c("the man with"), corpus = "eng_2012", year_start = 1500, year_end = 2008, smoothing = 3, count = FALSE, tag = NULL)
head(freq)














count.chars         = character.count(text)   #integer
count.chars.freq    = character.table(text,grouping.var=NULL, percent = FALSE, prop.by.row = TRUE, zero.replace = 0, digits = 2)
count.words.freq    = all_words(text)         #dataframe
count.syllable      = syllable.count(text, remove.bracketed = TRUE, algorithm.report = FALSE)
count.words         = word.count(text, byrow = TRUE, missing = NA, digit.remove = TRUE, names = FALSE)

sum.syllable        = syllable.sum(text, parallel = TRUE)
sum.poly_syllable   = polysyllable.sum(text, parallel = TRUE)
sum.combo_syllable  = combo_syllable.sum(text, parallel = TRUE)

text.pos            = pos(count.words.freq, parallel = TRUE, na.omit = FALSE, digits = 1, progress.bar = TRUE, percent = FALSE, zero.replace = 0, gc.rate = 10)
text.formality      = formality(text.pos, grouping.var = NULL, sort.by.formality = TRUE, digits = 2)
text.polarity       = polarity(text, grouping.var = NULL, positive.list = pos, negative.list = neg, 
                               negation.list = negation.words, amplification.list = increase.amplification.words, 
                               rm.incomplete = FALSE, digits = 3)

x = word_stats(text, grouping.var = NULL, tot = NULL, parallel = FALSE, rm.incomplete = FALSE )digit.remove = FALSE, apostrophe.remove = FALSE, digits = 3)

pos = data(positive.words)
neg = data(negative.words)
amp = data(a)

polarity(text, grouping.var = NULL, positive.list = pos, negative.list = neg, 
         negation.list = negation.words, amplification.list = increase.amplification.words, 
         rm.incomplete = FALSE, digits = 3)



dissimilarity(text, grouping.var = NULL, method = "prop", diag = FALSE, upper = FALSE, p = 2)
formality(text, grouping.var = NULL, sort.by.formality = TRUE, digits = 2)


termco(text, grouping.var=NULL, match.list, short.term = FALSE, 
       ignore.case = TRUE, lazy.term = TRUE, elim.old = TRUE, 
       zero.replace = 0, output = "percent", digits = 2)


gantt_plot(text, grouping.var = NULL, rm.var = NULL, fill.var = NULL, xlab = "duration (in words)", 
           units = "words", col.sep = "_")

print( ngrams(text, grouping.var = NULL, n = 2) )

