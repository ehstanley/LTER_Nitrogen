# #################################################################
# Code go merge flow and concentration data for Lake Mendota outlet
# Concentration from NTL-Lake Mendota Buoy
# Flow data from USGS NWIS
# #################################################################

Dates<-as.Date(c("2010-01-01", "2016-12-31"))

# get LTER chemistry data
chemdata<-readRDS('Data/NTL_ChemicalLimnology.rds')
head(chemdata)
str(chemdata)
chemdata$lakeid<-as.character(chemdata$lakeid)

# Create a list of dataframes for each NTL-Lake
# Example: Lake Mendota dataframe can be called with 'lakelist$ME'
lakelist<-split(chemdata, chemdata$lakeid)

# or make each lake it's own df in the global environment
# Lake Mendota can now be called with 'ME'
list2env(lakelist, envir=.GlobalEnv)

dischargedata<-readRDS('Data/NWIS_MendotaOutletDischarge.rds')
head(dischargedata)
str(dischargedata)

mergedata<-merge(dischargedata, ME, by.x='Date', by.y='sampledate', all=T)
head(mergedata)
plot(mergedata$Date, mergedata$Flow_cms, type="l")
points(mergedata$Date, mergedata$no3no2_sloh, col="red")

plot(mergedata$Date, mergedata$no3no2_sloh*mergedata$Flow_cms, xlim=Dates)

