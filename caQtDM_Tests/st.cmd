#!../../bin/win32-x86/softioc

## You may have to change softioc to something else
## everywhere it appears in this file

< envPaths

#cd ${TOP}

## Register all support components
dbLoadDatabase "../../dbd/ioc.dbd"
ioc_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("C:/Qt/4.8.2/src/caQtDM/tests/mySimulation.db","user=brandsHost")




#cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=brandsHost"
