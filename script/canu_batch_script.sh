#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 13:00:00
#SBATCH -J canu_lf_genome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com

# This script assembles a genome with canu
# using the reads from fastq.gz files

#Load modules
module load bioinfo-tools
module load canu

canu -p "lfer" \
genomeSize="2.6m" \
-d "/home/emla007/genome_analyses/data/DNA_data/assembly" \
stopOnReadQuality="false" \
correctedErrorRate="0.04" \
-pacbio-raw /home/emla007/genome_analyses/data/raw_data/DNA_raw_data/ERR2028*.fastq.gz
