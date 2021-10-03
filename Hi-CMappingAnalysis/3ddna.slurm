#! /bin/bash -l              
#SBATCH -A snic2020-5-20
#SBATCH -o 3ddna.out                  
#SBATCH -e 3ddna.err                  
#SBATCH -J 3ddna.job                  
#SBATCH -p node -n 20
#SBATCH -t 10-00:00:00
#SBATCH -D /proj/uppstore2017185/private/wabi/vanessa_cardui/data/interim/HiC/02-3ddna
#SBATCH --mail-user per.unneberg@scilifelab.se
#SBATCH --mail-type=ALL      

module load bioinfo-tools    
module load lastz            
module load gnuparallel      

CMD=/proj/uppstore2017185/private/wabi/vanessa_cardui/opt/3d-dna/run-asm-pipeline.sh

conda activate 3ddna

INPUT_SIZE=15000

ASSEMBLY=/proj/uppstore2017185/private/wabi/vanessa_cardui/data/interim/HiC/01-juicer/reference/pacbio.prim.assembly.fasta

MND=/proj/uppstore2017185/private/wabi/vanessa_cardui/data/interim/HiC/01-juicer/aligned/merged_nodups.txt

${CMD} -i ${INPUT_SIZE} ${ASSEMBLY} ${MND}
