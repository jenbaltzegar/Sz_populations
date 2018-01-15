#!/bin/bash

# Wrapper script to run de novo stacks pipeline on weevil population data

cd ~/temp_JenB/RawData/DemultiplexedData

# Call denovo_map pipeline
# set min depth of coverage; number mismatches allowed between stacks; number of mismatches allowed between loci
denovo_map.pl -m 3 -M 5 -n 5 \  
  # specify number of threads to use
  -T 5 \                    
  # disable all database options
  -S \                      
  # specify batch id
  -b 1 \                    
  # diable calling haplotypes from secondary reads
  -H \                      
  # path to write pipeline output files
  -o ./output_stacks \      
  # chi square significance level required to call a heterozygote or homozygote
  --alpha 0.05 \            
  # specify path to find pOpulation map
  -O ./renamed_samples \    
  # specify max number of stacks at a single de novo locus; enable deleveraging algorithm
  -X "ustacks: --max_locus_stacks 2 -d" \       
  # specify min num of populations a locus must be present in; enable F-stats; 
  # enable kernel smoothed calculations; output results in Structure format
  -X "populations: -p 2 -fstats -k --fasta --structure"