#!/bin/bash
# Script to process NCBI fastq sequences
# to then use for a BLAST search within Genbank

# Allison Bogisich, asbogisich@dons.usfca.edu
# November 22, 2017

export PATH=$PATH:/c/Users/allyb/Desktop/2017_cs640_Bioinformatics/2017_cs640_R-Scripts-Projects/ABogisich-final-project/sratoolkit.2.8.2-1-win64/bin
# Make sure to have sra-tool kit in library
# Download the list of files in the SRA run table
# to the raw data directory
# the pipe and tail -n+2 is a nice way to exclude the first line
for SRA_number in $(cut -f 8 data/metadata/loudon_microbial_community_salamanders_SRARunTable.txt | tail -n +2)
do
  fastq-dump -v $SRA_number -O data/raw_data
done
echo "List of files downloaded."
