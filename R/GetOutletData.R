# ##################################################################################
# Get discharge data from Yahara River at Main St in Madison
# Use this data with concentration data from Lake Mendota buoy to calculate N export
# ##################################################################################

#install packages
library(dataRetrieval)

# Set NWIS codes for Yahara River discharge at Main St (Madison, WI)
MendotaOut<-c("05428500")
ParameterCd <- c("00060") # Discharge
StartDate <- "1995-01-01"
EndDate <- "2016-12-31"

# Assess NWIS Data available
SiteINFO<-readNWISsite(MendotaOut)
DailyDataAvailable <- whatNWISdata(MendotaOut, service="uv")

# Get data and convert to cubic meter per second
QTable <- readNWISdv(MendotaOut, ParameterCd, StartDate, EndDate)
QTable <- renameNWISColumns(QTable)
QTable$Flow_cms<-QTable$Flow /35.3147

# Look at Data
head(QTable)
plot(QTable$Flow_cms~ QTable$Date, type="l")

# Save as rds and csv file to Data directory
saveRDS(QTable, 'Data/NWIS_MendotaOutletDischarge.rds')
write.table(QTable, file='Data/NWIS_MendotaOutletDischarge.csv', sep=",")




