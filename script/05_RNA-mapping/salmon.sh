#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 4:00:00
#SBATCH -J salmon_l_ferriphilum
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com

module load bioinfo-tools
module load Salmon/0.9.1

INPUT_DIR="/home/emla007/genome_analyses/data/raw_data/3_Christel_2017/RNA_trimmed_reads"
OUT_DIR="/home/emla007/genome_analyses/data/RNA_data/salmon_output"

mkdir -p $OUT_DIR

INPUT_REF="/home/emla007/genome_analyses/data/DNA_data/assembly/03_lfer_prokka_02_removed_overlap.ffn"

DB_DIR="/home/emla007/genome_analyses/salmon_db"
DB_PREFIX="prokka_annotation_db"

mkdir -p $DB_DIR

salmon index -t $INPUT_REF -i $DB_DIR/$DB_PREFIX -k 31
DB="$DB_DIR/$DB_PREFIX"

FWD=("ERR2036629_P1.trim.fastq.gz" "ERR2036631_P1.trim.fastq.gz" "ERR2036633_P1.trim.fastq.gz" "ERR2117289_P1.trim.fastq.gz" "ERR2117291_P1.trim.fastq.gz" "ERR2036630_P1.trim.fastq.gz" "ERR2036632_P1.trim.fastq.gz" "ERR2117288_P1.trim.fastq.gz" "ERR2117290_P1.trim.fastq.gz" "ERR2117292_P1.trim.fastq.gz")

REV=("ERR2036629_P2.trim.fastq.gz" "ERR2036631_P2.trim.fastq.gz" "ERR2036633_P2.trim.fastq.gz" "ERR2117289_P2.trim.fastq.gz" "ERR2117291_P2.trim.fastq.gz" "ERR2036630_P2.trim.fastq.gz" "ERR2036632_P2.trim.fastq.gz" "ERR2117288_P2.trim.fastq.gz" "ERR2117290_P2.trim.fastq.gz" "ERR2117292_P2.trim.fastq.gz")

for i in $(seq 0 ${#FWD[@]}); do
  BN=`basename ${FWD[i]} _P1.trim.fastq.gz`
  salmon quant -i $DB \
               -l A \
               --gcBias \
               --threads 4 \
               -1 $INPUT_DIR/${FWD[i]} \
               -2 $INPUT_DIR/${REV[i]} \
               -o $OUT_DIR/$BN
done
