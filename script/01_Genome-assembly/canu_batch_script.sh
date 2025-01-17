#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 14:00:00
#SBATCH -J canu_l_ferriphilum
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com

# This script assembles a genome with canu
# using the reads from fastq.gz files

IN_DIR="/home/emla007/genome_analyses/data/raw_data/DNA_raw_data"
OUT_DIR="/home/emla007/genome_analyses/data/DNA_data/annotation"

mkdir -p $OUT_DIR

# Custom settings:
PREFIX="lfer"                # File name prefix of intermediate and output files
GENOME_SIZE="2.6m"                      # Expected genome size
STOP_ON_RQ="false"                      # stopOnReadQuality - Don't stop assembly
                                        # in case of low read quality
CORR_ERR_RATE="0.040"                   # Improves assembly speed without affecting assembly (when coverage > 60x)
                                        # Setting taken from the doc
IN_FILES="ERR2028*.fastq.gz"            # This expression will be expanded to all fastq.gz
                                        # files in a directory

canu -p $PREFIX genomeSize=$GENOME_SIZE \
-d $OUT_DIR stopOnReadQuality=$STOP_ON_RQ \
correctedErrorRate=$CORR_ERR_RATE -pacbio-raw \
$IN_DIR/$IN_FILES
