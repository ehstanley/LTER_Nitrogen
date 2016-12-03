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


# Example plot Lake Mendota and Lake Monona nitrate with connected lines
par(pch=16)
plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh),], col="blue", type="o")
points(no3no2_sloh~sampledate, data=lakelist$MO[!is.na(lakelist$MO$no3no2_sloh),], col="red", type="o")
legend('topleft', inset=0.02, c('Mendota', 'Monona'), col=c('blue', 'red'), pch=16, bty="n")

# Example plot Lake Mendota nitrate and ammonium with connected lines
par(pch=16)
plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh),], col="blue", type="o", ylab="N (mg N/L)", ylim=c(0,4))
points(nh4_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$nh4_sloh),], col="red", type="p", lwd=0.5)
legend('topleft', inset=0.02, c('NO3', 'NH4'), col=c('blue', 'red'), pch=16, bty="n")


