# Code to download NTL-LTER chemical limnology

# Package ID: knb-lter-ntl.1.12 Cataloging System:https://pasta.lternet.edu.
# Data set title: North Temperate Lakes LTER: Chemical Limnology of Primary Study Lakes: Nutrients, pH and Carbon 1981 - current.
# Data set creator:    - Center for Limnology 
# Data set creator:    - NTL LTER 
# Metadata Provider:    - North Temperate Lakes LTER 
# Contact:    - Information Manager LTER Network Office  - tech-support@lternet.edu
# Contact:    - NTL LTER Information Manager University of Wisconsin  - infomgr@lter.limnology.wisc.edu
# Contact:    - NTL LTER Lead PI Center for Limnology  - leadpi@lter.limnology.wisc.edu
# Metadata Link: https://portal.lternet.edu/nis/metadataviewer?packageid=knb-lter-ntl.1.12
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@lternet.edu 

infile1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/1/12/1932bb71889c8e25cb216c8dc0db33d5" 
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
                 "ph",     
                 "phair",     
                 "alk",     
                 "dic",     
                 "tic",     
                 "doc",     
                 "toc",     
                 "no3no2",     
                 "no2",     
                 "nh4",     
                 "totnf",     
                 "totnuf",     
                 "totpf",     
                 "totpuf",     
                 "drsif",     
                 "brsif",     
                 "brsiuf",     
                 "tpm",     
                 "no3no2_sloh",     
                 "nh4_sloh",     
                 "kjdl_n_sloh",     
                 "totpuf_sloh",     
                 "drp_sloh",     
                 "drsif_sloh",     
                 "flagdepth",     
                 "flagph",     
                 "flagphair",     
                 "flagalk",     
                 "flagdic",     
                 "flagtic",     
                 "flagdoc",     
                 "flagtoc",     
                 "flagno3no2",     
                 "flagno2",     
                 "flagnh4",     
                 "flagtotnf",     
                 "flagtotnuf",     
                 "flagtotpf",     
                 "flagtotpuf",     
                 "flagdrsif",     
                 "flagbrsif",     
                 "flagbrsiuf",     
                 "flagtpm",     
                 "flagno3no2_sloh",     
                 "flagnh4_sloh",     
                 "flagkjdl_n_sloh",     
                 "flagtotpuf_sloh",     
                 "flagdrp_sloh",     
                 "flagdrsif_sloh"    ), check.names=TRUE)


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
if (class(dt1$ph)=="factor") dt1$ph <-as.numeric(levels(dt1$ph))[as.integer(dt1$ph) ]
if (class(dt1$phair)=="factor") dt1$phair <-as.numeric(levels(dt1$phair))[as.integer(dt1$phair) ]
if (class(dt1$alk)=="factor") dt1$alk <-as.numeric(levels(dt1$alk))[as.integer(dt1$alk) ]
if (class(dt1$dic)=="factor") dt1$dic <-as.numeric(levels(dt1$dic))[as.integer(dt1$dic) ]
if (class(dt1$tic)=="factor") dt1$tic <-as.numeric(levels(dt1$tic))[as.integer(dt1$tic) ]
if (class(dt1$doc)=="factor") dt1$doc <-as.numeric(levels(dt1$doc))[as.integer(dt1$doc) ]
if (class(dt1$toc)=="factor") dt1$toc <-as.numeric(levels(dt1$toc))[as.integer(dt1$toc) ]
if (class(dt1$no3no2)=="factor") dt1$no3no2 <-as.numeric(levels(dt1$no3no2))[as.integer(dt1$no3no2) ]
if (class(dt1$no2)=="factor") dt1$no2 <-as.numeric(levels(dt1$no2))[as.integer(dt1$no2) ]
if (class(dt1$nh4)=="factor") dt1$nh4 <-as.numeric(levels(dt1$nh4))[as.integer(dt1$nh4) ]
if (class(dt1$totnf)=="factor") dt1$totnf <-as.numeric(levels(dt1$totnf))[as.integer(dt1$totnf) ]
if (class(dt1$totnuf)=="factor") dt1$totnuf <-as.numeric(levels(dt1$totnuf))[as.integer(dt1$totnuf) ]
if (class(dt1$totpf)=="factor") dt1$totpf <-as.numeric(levels(dt1$totpf))[as.integer(dt1$totpf) ]
if (class(dt1$totpuf)=="factor") dt1$totpuf <-as.numeric(levels(dt1$totpuf))[as.integer(dt1$totpuf) ]
if (class(dt1$drsif)=="factor") dt1$drsif <-as.numeric(levels(dt1$drsif))[as.integer(dt1$drsif) ]
if (class(dt1$brsif)=="factor") dt1$brsif <-as.numeric(levels(dt1$brsif))[as.integer(dt1$brsif) ]
if (class(dt1$brsiuf)=="factor") dt1$brsiuf <-as.numeric(levels(dt1$brsiuf))[as.integer(dt1$brsiuf) ]
if (class(dt1$tpm)=="factor") dt1$tpm <-as.numeric(levels(dt1$tpm))[as.integer(dt1$tpm) ]
if (class(dt1$no3no2_sloh)=="factor") dt1$no3no2_sloh <-as.numeric(levels(dt1$no3no2_sloh))[as.integer(dt1$no3no2_sloh) ]
if (class(dt1$nh4_sloh)=="factor") dt1$nh4_sloh <-as.numeric(levels(dt1$nh4_sloh))[as.integer(dt1$nh4_sloh) ]
if (class(dt1$kjdl_n_sloh)=="factor") dt1$kjdl_n_sloh <-as.numeric(levels(dt1$kjdl_n_sloh))[as.integer(dt1$kjdl_n_sloh) ]
if (class(dt1$totpuf_sloh)=="factor") dt1$totpuf_sloh <-as.numeric(levels(dt1$totpuf_sloh))[as.integer(dt1$totpuf_sloh) ]
if (class(dt1$drp_sloh)=="factor") dt1$drp_sloh <-as.numeric(levels(dt1$drp_sloh))[as.integer(dt1$drp_sloh) ]
if (class(dt1$drsif_sloh)=="factor") dt1$drsif_sloh <-as.numeric(levels(dt1$drsif_sloh))[as.integer(dt1$drsif_sloh) ]
if (class(dt1$flagdepth)!="factor") dt1$flagdepth<- as.factor(dt1$flagdepth)
if (class(dt1$flagph)!="factor") dt1$flagph<- as.factor(dt1$flagph)
if (class(dt1$flagphair)!="factor") dt1$flagphair<- as.factor(dt1$flagphair)
if (class(dt1$flagalk)!="factor") dt1$flagalk<- as.factor(dt1$flagalk)
if (class(dt1$flagdic)!="factor") dt1$flagdic<- as.factor(dt1$flagdic)
if (class(dt1$flagtic)!="factor") dt1$flagtic<- as.factor(dt1$flagtic)
if (class(dt1$flagdoc)!="factor") dt1$flagdoc<- as.factor(dt1$flagdoc)
if (class(dt1$flagtoc)!="factor") dt1$flagtoc<- as.factor(dt1$flagtoc)
if (class(dt1$flagno3no2)!="factor") dt1$flagno3no2<- as.factor(dt1$flagno3no2)
if (class(dt1$flagno2)!="factor") dt1$flagno2<- as.factor(dt1$flagno2)
if (class(dt1$flagnh4)!="factor") dt1$flagnh4<- as.factor(dt1$flagnh4)
if (class(dt1$flagtotnf)!="factor") dt1$flagtotnf<- as.factor(dt1$flagtotnf)
if (class(dt1$flagtotnuf)!="factor") dt1$flagtotnuf<- as.factor(dt1$flagtotnuf)
if (class(dt1$flagtotpf)!="factor") dt1$flagtotpf<- as.factor(dt1$flagtotpf)
if (class(dt1$flagtotpuf)!="factor") dt1$flagtotpuf<- as.factor(dt1$flagtotpuf)
if (class(dt1$flagdrsif)!="factor") dt1$flagdrsif<- as.factor(dt1$flagdrsif)
if (class(dt1$flagbrsif)!="factor") dt1$flagbrsif<- as.factor(dt1$flagbrsif)
if (class(dt1$flagbrsiuf)!="factor") dt1$flagbrsiuf<- as.factor(dt1$flagbrsiuf)
if (class(dt1$flagtpm)!="factor") dt1$flagtpm<- as.factor(dt1$flagtpm)
if (class(dt1$flagno3no2_sloh)!="factor") dt1$flagno3no2_sloh<- as.factor(dt1$flagno3no2_sloh)
if (class(dt1$flagnh4_sloh)!="factor") dt1$flagnh4_sloh<- as.factor(dt1$flagnh4_sloh)
if (class(dt1$flagkjdl_n_sloh)!="factor") dt1$flagkjdl_n_sloh<- as.factor(dt1$flagkjdl_n_sloh)
if (class(dt1$flagtotpuf_sloh)!="factor") dt1$flagtotpuf_sloh<- as.factor(dt1$flagtotpuf_sloh)
if (class(dt1$flagdrp_sloh)!="factor") dt1$flagdrp_sloh<- as.factor(dt1$flagdrp_sloh)
if (class(dt1$flagdrsif_sloh)!="factor") dt1$flagdrsif_sloh<- as.factor(dt1$flagdrsif_sloh)

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
summary(ph)
summary(phair)
summary(alk)
summary(dic)
summary(tic)
summary(doc)
summary(toc)
summary(no3no2)
summary(no2)
summary(nh4)
summary(totnf)
summary(totnuf)
summary(totpf)
summary(totpuf)
summary(drsif)
summary(brsif)
summary(brsiuf)
summary(tpm)
summary(no3no2_sloh)
summary(nh4_sloh)
summary(kjdl_n_sloh)
summary(totpuf_sloh)
summary(drp_sloh)
summary(drsif_sloh)
summary(flagdepth)
summary(flagph)
summary(flagphair)
summary(flagalk)
summary(flagdic)
summary(flagtic)
summary(flagdoc)
summary(flagtoc)
summary(flagno3no2)
summary(flagno2)
summary(flagnh4)
summary(flagtotnf)
summary(flagtotnuf)
summary(flagtotpf)
summary(flagtotpuf)
summary(flagdrsif)
summary(flagbrsif)
summary(flagbrsiuf)
summary(flagtpm)
summary(flagno3no2_sloh)
summary(flagnh4_sloh)
summary(flagkjdl_n_sloh)
summary(flagtotpuf_sloh)
summary(flagdrp_sloh)
summary(flagdrsif_sloh) 
detach(dt1)               




