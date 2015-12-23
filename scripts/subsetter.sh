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
## PURPOSE:      Program to subset the eReefs data based on a bounding box input.
##
##              ./subsetter.sh 145.0 151.0 -21.0 -15.5 ../data/A20090121.P1D.ANN_MIM_RMP.nc
##
## N.B:         This code expects that you've sourced the projects config.env
##              Relies on nco kitchen sink tools.
##              Be sure to do your coordinates with decimals.
##
######################################################################

#TODO: try catch type things on the env var loading to check that he config.env is sourced.

if [ $# -eq 5 ]
  then
  echo "######################################################################"
  echo "                      Starting the subsetter.sh script."
  echo ""
  echo You passed $# arguments to $0: $*
  printf "It looks like you're interested in the following region:\n"
  # set up the spatial boundaries of each corner of the plot:
  LONMIN=$1 ; LONMAX=$2 # Longitude range of plots
  LATMIN=$3 ; LATMAX=$4 # Latitude range of plots
  echo longitude min: $LONMIN
  echo longitude max: $LONMAX
  echo latitude min: $LATMIN
  echo latitude max: $LATMAX

  # LONMIN=145 ; LONMAX=151 # Longitude range of plots
  # LATMIN=-21 ; LATMAX=-15.5 # Latitude range of plots

  printf "Working on the nc file you passed me, which is:\n"
  INPUTNCFILE=$5
  echo $INPUTNCFILE
  input_filename=${INPUTNCFILE##*/}
  printf "The full path to this file is:\n"
  input_file=$DATA_DIR/$input_filename
  echo $input_file
  output_file=$DATA_DIR/${input_filename%???}.subset.$LONMIN.$LONMAX.$LATMIN.$LATMAX.nc

# Use the Netcdf Kitchen Sink:
  ncks -d lat,$LATMIN,$LATMAX -d lon,$LONMIN,$LONMAX $INPUTNCFILE -O $output_file

# This works:
#  ncks -d lat,-22.3,-15.9 -d lon,144.8,150.4 $infile -O  $outfile
  echo "The result is saved here:"
  echo $output_file
  echo ""
  # example from: http://research.jisao.washington.edu/data_sets/nco/#example10
  # Say you have a global dataset, and you only want the data for the northeast portion of the Pacific Ocean.
  # ncea -d lat,minimum_lat,maximum_lat -d lon,minimum_lon,maximum_lon in.nc out.nc
  # where "lat" is what latitudes are called your file, and minimum_lat and
  # maximum_lat are latitudes. Integer latitudes/longitudes are treated as indices,
  # and floating point latitudes/longitudes are actual latitudes/longitudes.
  # An example is in the NCO documentation.
  echo "                           Finshed."
  echo "######################################################################"
  else
    echo "######################################################################"
    echo ""
    echo "ERROR: Wrong arguments supplied"
    echo Please run as $0 LONMIN LONMAX LATMIN LATMAX NC_FILE
    echo ""
    echo "Example: ./subsetter.sh 145.0 151.0 -21.0 -15.5 ../data/A20090121.P1D.ANN_MIM_RMP.nc"
    echo "Be sure that all coordinate values are floats - e.g. they have decimals even when .0"
    echo ""
    echo "######################################################################"
    exit 1
fi
