# ################################################
# Load chemistry data to start analysis
# Plot timeseries of NO3, NH4, kjdl_N in Lake Mendota (surface and hypo)
# Plot timeseries of NO3 in Mendota, Monona, Wingra, and trout
# ################################################

library(RColorBrewer)
library(colorRamps)

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

# Example plot Lake Mendota, Monona, Wingra, and Trout nitrate with connected lines

png('Figures/NO3TimeSeries_4Lakes.png', width=13, height=4, units='in', res=200, bg=NA)
par(pch=16)
par(ps=14)
par(mar = c(3,3,0.5,0.5),mgp=c(1.5,0.4,0),tck=-0.02)

plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh) & lakelist$ME$depth<2,], col="blue", type="o", ylab='NO3 (mg N/L)')
points(no3no2_sloh~sampledate, data=lakelist$MO[!is.na(lakelist$MO$no3no2_sloh) & lakelist$MO$depth<2,], col="red", type="o")
points(no3no2/1000~sampledate, data=lakelist$TR[!is.na(lakelist$TR$no3no2) & lakelist$TR$depth<2,], col="lightblue", type="o")
points(no3no2_sloh~sampledate, data=lakelist$WI[!is.na(lakelist$WI$no3no2_sloh) & lakelist$WI$depth<2,], col="green", type="o")
legend('topleft', inset=0.02, c('Mendota', 'Monona', 'Trout', 'Wingra'), col=c('blue', 'red', 'lightblue', 'green'), pch=16, bty="n", ncol=2)
axis(1, at=seq.Date(as.Date('1950-01-01'), as.Date('2020-01-01'), by='year'), labels=NA)

dev.off()

# Example plot Lake Mendota nitrate and ammonium with connected lines (surface)
png('Figures/MendotaTimeSeries_NO3_NH4.png', width=13, height=4, units='in', res=200, bg=NA)
par(pch=16)
par(ps=14)
par(mar = c(3,3,0.5,0.5),mgp=c(1.5,0.4,0),tck=-0.02)

plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh) & lakelist$ME$depth<2,], col="blue", type="o", lwd=0.5, ylab="N (mg N/L)", ylim=c(0,2))
points(nh4_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$nh4_sloh) & lakelist$ME$depth<2,], col="red", type="o", lwd=0.5)
points(kjdl_n_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$kjdl_n_sloh) & lakelist$ME$depth<2,], col="orange", type="o", lwd=0.5)

legend('topleft', inset=0.02, c('NO3', 'NH4', 'kjdl_n'), col=c('blue', 'red', 'orange'), pch=16, bty="n")
legend('top', inset=0.02, 'Surface', bty="n")
axis(1, at=seq.Date(as.Date('1950-01-01'), as.Date('2020-01-01'), by='year'), labels=NA)

dev.off()

# Example plot Lake Mendota nitrate, ammonium, kjdl - Hypolimnion
png('Figures/MendotaTimeSeries_NO3_NH4_hypo.png', width=13, height=4, units='in', res=200, bg=NA)
par(pch=16)
par(ps=14)
par(mar = c(3,3,0.5,0.5),mgp=c(1.5,0.4,0),tck=-0.02)

plot(no3no2_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$no3no2_sloh) & lakelist$ME$depth>19,], col="blue", type="o", lwd=0.5, ylab="N (mg N/L)", ylim=c(0,5))
points(nh4_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$nh4_sloh) & lakelist$ME$depth>19,], col="red", type="o", lwd=0.5)
points(kjdl_n_sloh~sampledate, data=lakelist$ME[!is.na(lakelist$ME$kjdl_n_sloh) & lakelist$ME$depth>19,], col="orange", type="o", lwd=0.5)

legend('topleft', inset=0.02, c('NO3', 'NH4', 'kjdl_n'), col=c('blue', 'red', 'orange'), pch=16, bty="n")
legend('top', inset=0.02, 'Hypolimnion', bty="n")
axis(1, at=seq.Date(as.Date('1950-01-01'), as.Date('2020-01-01'), by='year'), labels=NA)

dev.off()



# test code

MEyear<-split(ME, ME$year4)
str(MEyear)
colors<-blue2red(n=length(MEyear))
years<-names(MEyear)

plotcolor<-colors[match(ME$year4,years)]

plot(no3no2_sloh~daynum, data=ME, col=plotcolor, type="p", ylab="N (mg N/L)", ylim=c(0,4))

plot(nh4_sloh~daynum, data=ME, col=plotcolor, type="p", ylab="N (mg N/L)", ylim=c(0,4))
