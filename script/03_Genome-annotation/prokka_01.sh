
#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 00:15:00
#SBATCH -J prokka_lfer
#SBATCH --mail-type=ALL
#SBATCH --mail-user emilie.laurent@live.com
#SBATCH --qos=short

module load bioinfo-tools
module load prokka/1.12-12547ca

IN_DIR="/home/emla007/genome_analyses/analyses"
OUT_DIR="/home/emla007/genome_analyses/data/DNA_data/assembly"

#settings
IN_FILES="lfer.contigs00003551_removed_overlap.fasta"
PREFIX="03_lfer_prokka_02_removed_overlap" #Name of your outputfile
GRAM="neg" # Gramnegative = neg/- Grampositive = pos/+
CPU="4" #Number of cpu

#Setting used with no specification
#--rfam            Enable searching for ncRNAs with Infernal+Rfam (SLOW!) (default '0')
#--rnammer         Prefer RNAmmer over Barrnap for rRNA prediction (default OFF)


  prokka $IN_DIR/$IN_FILES  \
         --outdir $OUT_DIR \
         --prefix $PREFIX \
         --gram $GRAM \
         --cpus $CPU  \
         --rfam \
         --rnammer

  # Look for a folder called PROKKA_yyyymmdd (today's date) and look at stats
#cat PROKKA_yyyymmdd/*.txt
