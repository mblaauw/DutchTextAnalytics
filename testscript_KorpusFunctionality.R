library(tm)
library(koRpus)
library(tau)
library(textir)

txt.file = '/03_P-PROJECTS/CollectDutchBookFeatures/data/nl_books/Orka in vrijheid.txt'



ARI(txt.file, parameters = c(asl = 0.5, awl = 4.71, const = 21.43), )
    