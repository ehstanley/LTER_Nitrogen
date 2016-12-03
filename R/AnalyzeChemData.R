# ################################################
# Load chemistry data to start analysis
# ################################################

chemdata<-readRDS('Data/NTL_ChemicalLimnology.rds')
head(chemdata)
str(chemdata)
chemdata$lakeid<-as.character(chemdata$lakeid)

lakeids<-as.character(unique(chemdata$lakeid))

# Loop through chem data and subset based on lakeids
# Create a list of dataframes for each NTL-Lake
# Example: Lake Mendota dataframe can be called with 'lakelist$ME'

lakelist<-list()
lakenumber<-1
for (lakenumber in 1:length(lakeids)){
  lakedata<-chemdata[chemdata$lakeid==lakeids[lakenumber],]
  lakelist[[lakenumber]]<-lakedata
  names(lakelist)[[lakenumber]]<-lakeids[lakenumber]
}

# Example plot Lake Mendota and Lake Monona nitrate 
plot(lakelist$ME$sampledate, lakelist$ME$no3no2_sloh, col="blue")
points(lakelist$MO$sampledate, lakelist$MO$no3no2_sloh, col="red")
