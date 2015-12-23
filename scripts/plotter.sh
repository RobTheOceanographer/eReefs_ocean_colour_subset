#!/usr/bin/env bash

######################################################################
##
## DATE:         Dec 2015
## AUTHOR:       Robert Johnson robtheoceanographer@gmail.com
## VERSION:      0.01
## LANGUAGE:     bash/GMT
##
## USAGE:    ./plotter.sh LONMIN LONMAX LATMIN LATMAX VAR NC_FILE
##
## PURPOSE:  This plots your chosen domain of variable and file you give it.
##
######################################################################


if [ $# -eq 6 ]
  then
  echo "######################################################################"
  echo "                      Starting the plotter.sh script."
  echo ""

  var_to_plot="Chl_MIM"
  file_to_plot="A20101231.P1D.ANN_MIM_RMP.subset.145.0.151.0.-21.0.-15.5.nc"
  input_combo=$file_to_plot?$var_to_plot
  # set up the spatial boundaries of each corner of the plot:
  LONMIN=$1 ; LONMAX=$2 # Longitude range of plots
  LATMIN=$3 ; LATMAX=$4 # Latitude range of plots
  echo longitude min: $LONMIN
  echo longitude max: $LONMAX
  echo latitude min: $LATMIN
  echo latitude max: $LATMAX


  # grdimage 'A20101231.P1D.ANN_MIM_RMP.subset.145.0.151.0.-21.0.-15.5.nc?Chl_MIM' -R$LONMIN/$LATMIN/$LONMAX/$LATMAX -JX6i+ -K > quick.eps
  # # Add the coastline information
  # pscoast –R -JX6i+ –Dc –W1/2/255/255/255 –P –O –K –A10000 –N1/1/255/255/255 >> quick.eps
  # # Add a scale bar of the colors
  # psscale -D2.0i/4.75i/3.5i/.3ih -O -B2.5 >> plot.ps


else
  echo "######################################################################"
  echo ""
  echo "ERROR: Wrong arguments supplied"
  echo Please run as $0 LONMIN LONMAX LATMIN LATMAX VAR NC_FILE
  echo ""
  echo "Example: ./plotter.sh 145.0 151.0 -21.0 -15.5 Chl_MIM ../data/A20090121.P1D.ANN_MIM_RMP.nc"
  echo ""
  echo "######################################################################"
  exit 1
fi
