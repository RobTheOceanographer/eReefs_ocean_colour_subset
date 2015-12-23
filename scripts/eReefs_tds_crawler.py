#!/usr/bin/env python
######################################################################
## AUSTRALIAN BUREAU OF METEOROLOGY
## BUREAU NATIONAL OPERATIONS CENTRE
## SECTION: OCEANOGRAPHIC SYSTEMS DEVELOPMENT SECTION
##
## DATE:         Dec 2015
## AUTHOR:       Robert Johnson rjohnson@bom.gov.au
## VERSION:      0.01
## LANGUAGE:     Python
##
## USAGE:       python eReefs_tds_crawler.py
##
## PURPOSE:     This script reads the tds defined in the config.env and then
##              crawls through it to make a list of all the data urls available
##              for your time resolution of interest. This list is then saved as
##              a json filewith a date stamp for later use  - it gets put
##              in the DATA_DIR.
##
## N.B:         This code expects that you've sourced the projects config.env
##
##
######################################################################

######################################################################
# set up your python environment.
######################################################################
import simplejson
from thredds_crawler.crawl import Crawl
import os
import datetime
import pickle
######################################################################
# read in the config details and setup some vars.
######################################################################
# TDS =
# time_res = P1D # if p1d then set as ".*.P1D.ANN_MIM_RMP.nc"
DATA_DIR=os.environ.get('DATA_DIR')
output_file = os.path.join(DATA_DIR, 'crawled_urls')
crawled_tds_object_file = os.path.join(DATA_DIR, 'crawled_tds_object_' + datetime.date.today().strftime("%B_%d_%Y"))

######################################################################
# Crawl
######################################################################
print "######################################################################"
print "Crawl baby Crawl... this is likely to take a while..."
print "######################################################################"
crawled_tds_object = Crawl("http://ereeftds.bom.gov.au/ereefs/tds/catalog.xml", select=[".*.P1D.ANN_MIM_RMP.nc"], debug=True)

crawled_file_handle = open(crawled_tds_object_file, 'w')
pickle.dump(crawled_tds_object, crawled_file_handle)

# # save it example
# import pickle
# import math
# object_pi = math.pi
# file_pi = open('filename_pi.obj', 'w')
# pickle.dump(object_pi, file_pi)

# # load it back in:
# import pickle
# file_pi2 = open('filename_pi.obj', 'r')
# object_pi2 = pickle.load(file_pi2)

# print c.datasets

######################################################################
# Extract the URLS only
######################################################################
urls = [s.get("url") for d in c.datasets for s in d.services if s.get("service").lower() == "httpserver"]
# print urls


######################################################################
# Save the urls out as a txt file
######################################################################
f = open(output_file, 'w')
simplejson.dump(urls, f)
f.close()

print "######################################################################"
print "                           Finshed."
print "######################################################################"


#
# # this is how to read it back in:
# with open("crawled_data_urls.json") as f:
#   filecontents = simplejson.load(f)
#
#
#
# # finding only 2015
# matching = [s1 for s1 in filecontents if "2015" in s1]
