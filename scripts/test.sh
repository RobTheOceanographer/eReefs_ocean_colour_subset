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
######################################################################
source ./config.env

echo There are $# arguments to $0: $*
echo first argument: $1
echo second argument: $2
echo third argument: $3
echo here they are again: $@
