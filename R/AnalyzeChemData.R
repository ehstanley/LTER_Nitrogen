# ################################################
# Load chemistry data to start analysis
# ################################################

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

# Example plot Lake Mendota and Lake Monona nitrate with connected lines
par(pch=16)
par(mar = c(3,3,0.2,1),mgp=c(1,0.2,0),tck=-0.02)

plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh),], col="blue", type="o")
points(no3no2_sloh~sampledate, data=lakelist$MO[!is.na(lakelist$MO$no3no2_sloh),], col="red", type="o")
legend('topleft', inset=0.02, c('Mendota', 'Monona'), col=c('blue', 'red'), pch=16, bty="n")

# Example plot Lake Mendota nitrate and ammonium with connected lines
par(pch=16)
plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh),], col="blue", type="o", ylab="N (mg N/L)", ylim=c(0,4))
points(nh4_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$nh4_sloh),], col="red", type="p", lwd=0.5)
legend('topleft', inset=0.02, c('NO3', 'NH4'), col=c('blue', 'red'), pch=16, bty="n")


