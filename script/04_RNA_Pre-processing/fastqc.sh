#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J fastqc_trimmed_lfer
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com


module load bioinfo-tools
module load FastQC/0.11.8

IN_DIR="/home/emla007/genome_analyses/data/raw_data/3_Christel_2017/RNA_trimmed_reads"
OUT_DIR="/home/emla007/genome_analyses/data/RNA_data/pre_assembly_trimmed_fastqc"

mkdir -p $OUT_DIR

#settings
IN_FILES="ERR2*.fastq.gz"


 fastqc \
      -o $OUT_DIR \
      --threads 4 \
      $IN_DIR/$IN_FILES
