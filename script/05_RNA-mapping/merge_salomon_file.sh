#!/bin/bash -l

module load bioinfo-tools
module load Salmon/0.9.1



IN_DIR="/home/emla007/genome_analyses/data/RNA_data/salmon_output/ERR*"
OUT_DIR="/home/emla007/genome_analyses/data/RNA_data/salmon_output/salmon_count_matrix.txt"

salmon quantmerge \
--quants $IN_DIR \
--column numreads \
-o $OUT_DIR
