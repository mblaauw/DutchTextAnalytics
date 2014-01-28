library(qdap)

text  = "There was once a prince, and he wanted a princess, but then she must be a real Princess. He travelled right around the world to find one, but there was always something wrong. There were plenty of princesses, but whether they were real princesses he had great difficulty in discovering; there was always something which was not quite right about them. So at last he had come home again, and he was very sad because he wanted a real princess so badly.
One evening there was a terrible storm; it thundered and lightninged and the rain poured down in torrents; indeed it was a fearful night.
In the middle of the storm somebody knocked at the town gate, and the old King himself sent to open it.
It was a princess who stood outside, but she was in a terrible state from the rain and the storm. The water streamed out of her hair and her clothes; it ran in at the top of her shoes and out at the heel, but she said that she was a real princess.
‘Well we shall soon see if that is true,’ thought the old Queen, but she said nothing. She went into the bedroom, took all the bed clothes off and laid a pea on the bedstead: then she took twenty mattresses and piled them on top of the pea, and then twenty feather beds on top of the mattresses. This was where the princess was to sleep that night. In the morning they asked her how she slept.
‘Oh terribly bad!’ said the princess. ‘I have hardly closed my eyes the whole night! Heaven knows what was in the bed. I seemed to be lying upon some hard thing, and my whole body is black and blue this morning. It is terrible!’
They saw at once that she must be a real princess when she had felt the pea through twenty mattresses and twenty feather beds. Nobody but a real princess could have such a delicate skin.
So the prince took her to be his wife, for now he was sure that he had found a real princess, and the pea was put into the Museum, where it may still be seen if no one has stolen it.
Now this is a true story."

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

v_ngrams      = ngrams(text)
v_allwords    = all_words(text)
v_wordlist    = word_list(text, stopwords=v_stopwords)

v_pos         = pos(v_wordlist, digits=3)





# wfdf(text,stopwords=v_stopwords)



word_diff_list(v_allwords, grouping.var=action.verbs, stopwords=v_stopwords)























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

