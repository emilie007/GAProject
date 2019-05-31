#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 00:15:00
#SBATCH -J quast_lfer
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com
#SBATCH --qos=short

module load bioinfo-tools
module load quast/4.5.4

INPUT_DIR="/home/emla007/genome_analyses/data/raw_data/3_Christel_2017/DNA_raw_data/ERR2*.fastqc.gz"
OUTPUT_DIR="/home/emla007/genome_analyses/data/DNA_data/assembly_evaluation_quast"
REF_FILE="/home/emla007/genome_analyses/data/lfer_paper/OBMB01.fasta"
CONTIG_FILE="/home/emla007/genome_analyses/analyses/lfer.contigs00003551_removed_overlap.fasta"

 #python quast.py [options] <contig_file(s)>
 Python quast.py \
      -o $OUTPUT_DIR \
      -r $REF_FILE \
      -t 4 \
      --pacbio $INPUT_DIR \
      $CONTIG_FILE
# -o <output_dir>
#Output directory. The default value is quast_results/results_<date_time>.
#Also, quast_results/latest symlink is created.

#-r <path>
#Reference genome file. Optional. Many metrics can't be evaluated without a reference. If this is omitted, QUAST will only report the metrics that can be evaluated without a reference.

#--threads (or -t) <int>
#Maximum number of threads. The default value is 25% of all available CPUs but not less than 1. If QUAST fails to determine the number of CPUs, maximum threads number is set to 4.

#--k-mer-stats (or -k)
#Compute k-mer-based quality metrics, such as k-mer-based completeness, # k-mer-based misjoins. Recommended for large genomes (see also --large option). Affects performance, thus disabled by default.
#--k-mer-size <int>
#Size of k used in --k-mer-stats options. The default value is 101 bp. Use smaller values for genomes with high levels of heterozygosity. However, note that very small k-mer sizes may give irrelevant results for repeat-rich genomes.


#--pacbio <path>
#File with PacBio SMRT reads in FASTQ format (files compressed with gzip are allowed).
