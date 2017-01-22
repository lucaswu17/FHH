drug_death_1216 <- read.csv("Accidental_Drug_Related_Deaths_12_16.csv", header = TRUE)
trt_admin <- read.csv("Treatment_Admission.csv", header = TRUE)

summary(drug_death_1216)
summary(trt_admin)

levels(drug_death_1216$Fentanyl)
# cocaine, alcohol meth, heroin

levels(drug_death_1216$Heroin)
levels(drug_death_1216$Cocaine)
levels(drug_death_1216$Oxycodone)
levels(drug_death_1216$Oxymorphone)
levels(drug_death_1216$EtOH)
levels(drug_death_1216$Hydrocodone)
levels(drug_death_1216$Benzodiazepine)
levels(drug_death_1216$Methadone)
levels(drug_death_1216$Amphet)
levels(drug_death_1216$Tramad)
levels(drug_death_1216$Morphine..not.heroin.)
levels(drug_death_1216$Other)
levels(drug_death_1216$Any.Opioid)


# Fentanyl
drug_death_1216$Fentanyl <- sub("y", "Y", drug_death_1216$Fentanyl)
drug_death_1216$Fentanyl <- sub("Y-A", "Y", drug_death_1216$Fentanyl)
drug_death_1216$Fentanyl <- sub("Y POPS", "Y", drug_death_1216$Fentanyl)
drug_death_1216$Fentanyl <- sub("^$", "N", drug_death_1216$Fentanyl)
drug_death_1216$Fentanyl <- sub(" ", "N", drug_death_1216$Fentanyl)
drug_death_1216$Fentanyl <- as.factor(drug_death_1216$Fentanyl)

# Heroin
drug_death_1216$Heroin <- sub("y", "Y", drug_death_1216$Heroin)
drug_death_1216$Heroin <- sub(" Y", "Y", drug_death_1216$Heroin)
drug_death_1216$Heroin <- sub(" ", "N", drug_death_1216$Heroin)
drug_death_1216$Heroin <- sub("^$", "N", drug_death_1216$Heroin)
drug_death_1216$Heroin <- as.factor(drug_death_1216$Heroin)

# Cocaine
levels(drug_death_1216$Cocaine)
drug_death_1216$Cocaine <- sub("y", "Y", drug_death_1216$Cocaine)
drug_death_1216$Cocaine <- sub(" ", "N", drug_death_1216$Cocaine)
drug_death_1216$Cocaine <- sub("^$", "N", drug_death_1216$Cocaine)
drug_death_1216$Cocaine <- as.factor(drug_death_1216$Cocaine)

summary(drug_death_1216$Cocaine)



levels(drug_death_1216$Oxycodone)
drug_death_1216$Oxycodone <- sub("y", "Y", drug_death_1216$Oxycodone)
drug_death_1216$Oxycodone <- sub(" ", "N", drug_death_1216$Oxycodone)
drug_death_1216$Oxycodone <- sub("^$", "N", drug_death_1216$Oxycodone)
drug_death_1216$Oxycodone <- as.factor(drug_death_1216$Oxycodone)
summary(drug_death_1216$Oxycodone)


levels(drug_death_1216$Oxymorphone)
drug_death_1216$Oxymorphone <- sub("^$", "N", drug_death_1216$Oxymorphone)
drug_death_1216$Oxymorphone <- as.factor(drug_death_1216$Oxymorphone)
summary(drug_death_1216$Oxymorphone)

levels(drug_death_1216$EtOH)
drug_death_1216$EtOH <- sub("y", "Y", drug_death_1216$EtOH)
drug_death_1216$EtOH <- sub(" ", "N", drug_death_1216$EtOH)
drug_death_1216$EtOH <- sub("^$", "N", drug_death_1216$EtOH)
drug_death_1216$EtOH <- as.factor(drug_death_1216$EtOH)
summary(drug_death_1216$EtOH)

levels(drug_death_1216$Hydrocodone)
drug_death_1216$Hydrocodone <- sub("y", "Y", drug_death_1216$Hydrocodone)
drug_death_1216$Hydrocodone <- sub(" ", "N", drug_death_1216$Hydrocodone)
drug_death_1216$Hydrocodone <- sub("^$", "N", drug_death_1216$Hydrocodone)
drug_death_1216$Hydrocodone <- as.factor(drug_death_1216$Hydrocodone)
summary(drug_death_1216$Hydrocodone)


levels(drug_death_1216$Benzodiazepine)
drug_death_1216$Benzodiazepine <- sub("y", "Y", drug_death_1216$Benzodiazepine)
drug_death_1216$Benzodiazepine <- sub("Y ", "Y", drug_death_1216$Benzodiazepine)
drug_death_1216$Benzodiazepine <- sub(" ", "N", drug_death_1216$Benzodiazepine)
drug_death_1216$Benzodiazepine <- sub("^$", "N", drug_death_1216$Benzodiazepine)
drug_death_1216$Benzodiazepine <- as.factor(drug_death_1216$Benzodiazepine)
summary(drug_death_1216$Benzodiazepine)



levels(drug_death_1216$Methadone)
drug_death_1216$Methadone <- sub("y", "Y", drug_death_1216$Methadone)
drug_death_1216$Methadone <- sub(" ", "N", drug_death_1216$Methadone)
drug_death_1216$Methadone <- sub("^$", "N", drug_death_1216$Methadone)
drug_death_1216$Methadone <- as.factor(drug_death_1216$Methadone)
summary(drug_death_1216$Methadone)



levels(drug_death_1216$Amphet)
drug_death_1216$Amphet <- sub(" ", "N", drug_death_1216$Amphet)
drug_death_1216$Amphet <- sub("^$", "N", drug_death_1216$Amphet)
drug_death_1216$Amphet <- as.factor(drug_death_1216$Amphet)
summary(drug_death_1216$Tramad)




levels(drug_death_1216$Tramad)
drug_death_1216$Tramad <- sub("^$", "N", drug_death_1216$Tramad)
drug_death_1216$Tramad <- as.factor(drug_death_1216$Tramad)


levels(drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub("y", "Y", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub(" ", "N", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub("NONRX BUT STRAWS", "Y", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub("PCPNneg", "Y", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub("STOLENMEDS", "Y", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- sub("^$", "N", drug_death_1216$Morphine..not.heroin.)
drug_death_1216$Morphine..not.heroin. <- as.factor(drug_death_1216$Morphine..not.heroin.)
summary(drug_death_1216$Morphine..not.heroin.)


levels(drug_death_1216$Other)

levels(drug_death_1216$Any.Opioid)
drug_death_1216$Any.Opioid <- sub("y", "Y", drug_death_1216$Any.Opioid)
drug_death_1216$Any.Opioid <- sub(" ", "N", drug_death_1216$Any.Opioid)
drug_death_1216$Any.Opioid <- sub("^$", "N", drug_death_1216$Any.Opioid)
drug_death_1216$Any.Opioid <- as.factor(drug_death_1216$Any.Opioid)
summary(drug_death_1216$Any.Opioid)

colnames(drug_death_1216)[32] <- "Latitute"
colnames(drug_death_1216)[33] <- "Longitude"

drug_death_1216_new <- write.csv(drug_death_1216, file="drug_death_1216_new.csv")


# Age group
summary(drug_death_1216$Age)
density(x = drug_death_1216$Age)
hist(drug_death_1216$Age)
table(drug_death_1216$Age)

# Using cut
drug_death_1216$Age[is.na(drug_death_1216$Age)==TRUE] <- 42
drug_death_1216$Age_Group <- cut(drug_death_1216$Age, 
                       breaks = c(-Inf, 18, 23, 28, 33, 38, 43, 48, 53,58,63,68,73,78,83,88,Inf), 
                       labels = c("Below18", "18-22 yrs", "23-27 yrs", "28-32 yrs", "33-37 yrs", "38-42 yrs",
                                  "43-47 yrs","48-52 yrs","53-57 yrs","58-62 yrs","63-67 yrs","68-72 yrs",
                                  "73-77 yrs","78-82 yrs","83-87 yrs","87Above"), 
                       right = FALSE)
drug_death_1216[is.na(drug_death_1216$Age_Group)==TRUE,]

summary(as.factor(drug_death_1216$Age_Group))
levels(as.factor(drug_death_1216$Age_Group))
drug_death_1216$Age_Group <- as.factor(drug_death_1216$Age_Group)

# race
library(dplyr)
Fentanyl_race <- drug_death_1216 %>% dplyr::group_by(Race) %>% dplyr::summarise(count = length(which(Fentanyl == "Y")))
Fentanyl_age <- drug_death_1216 %>% dplyr::group_by(as.factor(Age_Group)) %>% dplyr::summarise(count = length(which(Fentanyl == "Y")))



# summary tables
library(lubridate)
drug_death_1216$DateN <- as.Date(drug_death_1216$Date, "%m/%d/%Y")
summary(drug_death_1216$DateN)
sum(is.na(drug_death_1216$Date)==TRUE)
drug_death_1216 <- drug_death_1216[-c(1:2),]



drug_death_1216[drug_death_1216$CaseNumber=="14-9876",]$Sex <- "Female"
drug_death_1216$Year <- as.factor(year(drug_death_1216$DateN))
drug_death_1216$Month <- as.factor(month(drug_death_1216$DateN))
drug_death_1216$Weekdays <- as.factor(weekdays(drug_death_1216$DateN))

Gender_all <- drug_death_1216 %>% dplyr::group_by(Sex,Year) %>% dplyr::summarise(count = length(Sex))
Month_all <- drug_death_1216 %>% dplyr::group_by(Year,Month) %>% dplyr::summarise(count = length(Month))
Weekdays_all <- drug_death_1216 %>% dplyr::group_by(Year,Weekdays) %>% dplyr::summarise(count = length(Weekdays))

Gender_FT <- drug_death_1216 %>% dplyr::group_by(Sex,Year) %>% dplyr::summarise(count = length(which(Fentanyl == "Y")))
Month_FT <- drug_death_1216 %>% dplyr::group_by(Year,Month) %>% dplyr::summarise(count =length(which(Fentanyl == "Y")))
Weekdays_FT <- drug_death_1216 %>% dplyr::group_by(Year,Weekdays) %>% dplyr::summarise(count = length(which(Fentanyl == "Y")))

Gender_all <- write.csv(Gender_all,file = "Gender_all.csv")
Month_all <- write.csv(Month_all,file = "Month_all.csv")
Weekdays_all <- write.csv(Weekdays_all,file = "Weekdays_all.csv")

Gender_FT <- write.csv(Gender_FT,file = "Gender_FT.csv")
Month_FT <- write.csv(Month_FT,file = "Month_FT.csv")
Weekdays_FT <- write.csv(Weekdays_FT,file = "Weekdays_FT.csv")


LL<- drug_death_1216 %>% dplyr::group_by(Latitute,Longitude) %>% dplyr::summarise(count = length(Month))
LL_heatmap <- write.csv(LL, file="LL_heatmap.csv")

LL_FT<- drug_death_1216 %>% dplyr::group_by(Latitute,Longitude) %>% dplyr::summarise(count = length(which(Fentanyl == "Y")))
LL_FT_heatmap <- write.csv(LL_FT, file="LL_FT_heatmap.csv")

a <- as.data.frame(levels(drug_death_1216$Death.City))
CT_Pop_City <- write.csv(a,file = "CT_Pop_City.csv")
CT_Pop_City_Final <- read.csv(file = "CT_Pop_Final.csv", header=TRUE)

colnames(CT_Pop_City_Final) <- c("Death.City", "Population")
drug_death_1216_pop <- drug_death_1216 %>%dplyr::left_join(CT_Pop_City_Final, by = "Death.City")
drug_death_1216_pop[is.na(as.factor(drug_death_1216_pop$Death.City)),]

drug_death_1216_pop$Death.City <- as.factor(drug_death_1216_pop$Death.City) 
write.csv(drug_death_1216_pop, "drug_death_1216_pop.csv")
