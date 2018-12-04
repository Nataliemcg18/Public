#1

myDF <- read.csv("names.txt", header=F, sep="|")
Pizza = myDF $V1[grep("NATALIE",myDF$V1)]
length(unique(Pizza))

I got 853 

#2a

length(unique(myDF$V1[grep('([A-Z])\\1',myDF$V1)]))

774063

#2b

length(unique(myDF$V1[grep('([AEIOU])\\1',myDF$V1)]))
129801

#2c

length(unique(myDF$V1[grep('([BCDFGHJKLMNPQRSTVWXYZ])\\1',myDF$V1)]))
678376
              