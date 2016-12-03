# ###################################################################
# Download NTL-LTER major ions of primary study lakes
# LakeIDs indiate lake name
# data are stored as a dataframe entitled 'dt1'
# ###################################################################


# Package ID: knb-lter-ntl.2.12 Cataloging System:https://pasta.lternet.edu.
# Data set title: North Temperate Lakes LTER: Chemical Limnology of Primary Study Lakes: Major Ions 1981 - current.
# Data set creator:    - Center for Limnology 
# Data set creator:    - NTL LTER 
# Metadata Provider:    - North Temperate Lakes LTER 
# Contact:    - Information Manager LTER Network Office  - tech-support@lternet.edu
# Contact:    - NTL LTER Information Manager University of Wisconsin  - infomgr@lter.limnology.wisc.edu
# Contact:    - NTL LTER Lead PI Center for Limnology  - leadpi@lter.limnology.wisc.edu
# Metadata Link: https://portal.lternet.edu/nis/metadataviewer?packageid=knb-lter-ntl.2.12
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@lternet.edu 

infile1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/2/12/1932bb71889c8e25cb216c8dc0db33d5" 
infile1 <- sub("^https","http",infile1) 
dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "lakeid",     
                 "year4",     
                 "daynum",     
                 "sampledate",     
                 "depth",     
                 "rep",     
                 "sta",     
                 "event",     
                 "cl",     
                 "so4",     
                 "ca",     
                 "mg",     
                 "na",     
                 "k",     
                 "fe",     
                 "mn",     
                 "cond",     
                 "flagcl",     
                 "flagso4",     
                 "flagca",     
                 "flagmg",     
                 "flagna",     
                 "flagk",     
                 "flagfe",     
                 "flagmn",     
                 "flagcond"    ), check.names=TRUE)


# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$lakeid)!="factor") dt1$lakeid<- as.factor(dt1$lakeid)
if (class(dt1$year4)=="factor") dt1$year4 <-as.numeric(levels(dt1$year4))[as.integer(dt1$year4) ]
if (class(dt1$daynum)=="factor") dt1$daynum <-as.numeric(levels(dt1$daynum))[as.integer(dt1$daynum) ]                                   
# attempting to convert dt1$sampledate dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
dt1$sampledate<-as.Date(dt1$sampledate,format=tmpDateFormat)
rm(tmpDateFormat) 
if (class(dt1$depth)=="factor") dt1$depth <-as.numeric(levels(dt1$depth))[as.integer(dt1$depth) ]
if (class(dt1$rep)!="factor") dt1$rep<- as.factor(dt1$rep)
if (class(dt1$sta)!="factor") dt1$sta<- as.factor(dt1$sta)
if (class(dt1$event)!="factor") dt1$event<- as.factor(dt1$event)
if (class(dt1$cl)=="factor") dt1$cl <-as.numeric(levels(dt1$cl))[as.integer(dt1$cl) ]
if (class(dt1$so4)=="factor") dt1$so4 <-as.numeric(levels(dt1$so4))[as.integer(dt1$so4) ]
if (class(dt1$ca)=="factor") dt1$ca <-as.numeric(levels(dt1$ca))[as.integer(dt1$ca) ]
if (class(dt1$mg)=="factor") dt1$mg <-as.numeric(levels(dt1$mg))[as.integer(dt1$mg) ]
if (class(dt1$na)=="factor") dt1$na <-as.numeric(levels(dt1$na))[as.integer(dt1$na) ]
if (class(dt1$k)=="factor") dt1$k <-as.numeric(levels(dt1$k))[as.integer(dt1$k) ]
if (class(dt1$fe)=="factor") dt1$fe <-as.numeric(levels(dt1$fe))[as.integer(dt1$fe) ]
if (class(dt1$mn)=="factor") dt1$mn <-as.numeric(levels(dt1$mn))[as.integer(dt1$mn) ]
if (class(dt1$cond)=="factor") dt1$cond <-as.numeric(levels(dt1$cond))[as.integer(dt1$cond) ]
if (class(dt1$flagcl)!="factor") dt1$flagcl<- as.factor(dt1$flagcl)
if (class(dt1$flagso4)!="factor") dt1$flagso4<- as.factor(dt1$flagso4)
if (class(dt1$flagca)!="factor") dt1$flagca<- as.factor(dt1$flagca)
if (class(dt1$flagmg)!="factor") dt1$flagmg<- as.factor(dt1$flagmg)
if (class(dt1$flagna)!="factor") dt1$flagna<- as.factor(dt1$flagna)
if (class(dt1$flagk)!="factor") dt1$flagk<- as.factor(dt1$flagk)
if (class(dt1$flagfe)!="factor") dt1$flagfe<- as.factor(dt1$flagfe)
if (class(dt1$flagmn)!="factor") dt1$flagmn<- as.factor(dt1$flagmn)
if (class(dt1$flagcond)!="factor") dt1$flagcond<- as.factor(dt1$flagcond)

# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lakeid)
summary(year4)
summary(daynum)
summary(sampledate)
summary(depth)
summary(rep)
summary(sta)
summary(event)
summary(cl)
summary(so4)
summary(ca)
summary(mg)
summary(na)
summary(k)
summary(fe)
summary(mn)
summary(cond)
summary(flagcl)
summary(flagso4)
summary(flagca)
summary(flagmg)
summary(flagna)
summary(flagk)
summary(flagfe)
summary(flagmn)
summary(flagcond) 
detach(dt1)               



# Save as rds file to Data directory
saveRDS(dt1, 'Data/NTL_MajorIons.rds')

# Save as csv file for easy sharing
write.table(dt1, file='Data/NTL_MajorIons.csv', sep=",")
