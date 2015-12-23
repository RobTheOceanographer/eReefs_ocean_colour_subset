#!/usr/bin/env bash
######################################################################
## AUSTRALIAN BUREAU OF METEOROLOGY
## BUREAU NATIONAL OPERATIONS CENTRE
## SECTION: OCEANOGRAPHIC SYSTEMS DEVELOPMENT SECTION
##
## DATE:         Dec 2015
## AUTHOR:       Robert Johnson rjohnson@bom.gov.au
## VERSION:      0.01
## LANGUAGE:     Bash
##
## PURPOSE:      Program to run the subsetter for several files and regions.
##
######################################################################
source ../config.env

printf "Subsetting the files you're interested in from the DATA_DIR.\n"

LONMIN=145.0 ; LONMAX=151.0 # Longitude range.
LATMIN=-21.0 ; LATMAX=-15.5 # Latitude range.

for a_file in A20090120.P1D.ANN_MIM_RMP.nc A20090123.P1D.ANN_MIM_RMP.nc A20101224.P1D.ANN_MIM_RMP.nc A20101227.P1D.ANN_MIM_RMP.nc A20101230.P1D.ANN_MIM_RMP.nc A20090121.P1D.ANN_MIM_RMP.nc A20101222.P1D.ANN_MIM_RMP.nc A20101225.P1D.ANN_MIM_RMP.nc A20101228.P1D.ANN_MIM_RMP.nc A20101231.P1D.ANN_MIM_RMP.nc A20090122.P1D.ANN_MIM_RMP.nc A20101223.P1D.ANN_MIM_RMP.nc A20101226.P1D.ANN_MIM_RMP.nc A20101229.P1D.ANN_MIM_RMP.nc
do
   # echo "Your date is $a_date"
   ./subsetter.sh $LONMIN $LONMAX $LATMIN $LATMAX $DATA_DIR/$a_file 2>&1 | tee $LOG_DIR/subsetter_log.log

done
