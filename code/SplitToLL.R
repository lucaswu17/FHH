Con=read.csv("Accidental_Drug_Related_Deaths.csv")

library(stringr)
library(plyr)
Con=Con[order(Con$Date),]

Con=cbind(Con,str_split_fixed(Con$DeathLoc, "\n", 2))
Con=rename(Con, c("1"="City","2"="LL"))
Con$LL = gsub("\\(|\\)", "", Con$LL)
Con=cbind(Con,str_split_fixed(Con$LL, ", ", 2))
Con=rename(Con, c("1"="Longitude","2"="Latitute"))
Con=Con[,-c("LL", "DeathLoc")]
Con <- subset(Con, select = -c(LL,DeathLoc) )
head(Con)

