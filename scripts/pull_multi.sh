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
## PURPOSE:      Program to run the thredds data puller for several dates.
##
######################################################################
source ./config.env

printf "Pulling dates you're interested in from the thredds server.\n"

# 20/01/2009 - 23/02/2009
# 22-31/12/2010

for a_date in 20090120 20090121 20090122 20090123 20101222 20101223 20101224 20101225 20101226 20101227 20101228 20101229 20101230 20101231
do
   # echo "Your date is $a_date"
   python $SCRIPT_DIR/pull.py $a_date 2>&1 | tee $LOG_DIR/pull_log.log
done
