#! /bin/bash -l              
#SBATCH -A snic2021-5-20
#SBATCH -o 3ddna.out                  
#SBATCH -e 3ddna.err                  
#SBATCH -J 3ddna.job                  
#SBATCH -p node -n 10
#SBATCH -t 24:00:00
#SBATCH -D /proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/05_3ddna10X 
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH --mail-type=ALL      

module load bioinfo-tools    
module load lastz            
module load gnuparallel      

CMD=/proj/uppstore2017185/private/wabi/vanessa_cardui/opt/3d-dna/run-asm-pipeline.sh

conda activate 3ddna

INPUT_SIZE=15000

#ROUND=0

ASSEMBLY=/proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/04_juicer10X/reference/10X.supernova.assembly.fasta

MND=/proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/04_juicer10X/aligned/merged_nodups.txt

${CMD} -i ${INPUT_SIZE} ${ASSEMBLY} ${MND}
