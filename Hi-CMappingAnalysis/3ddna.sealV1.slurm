#! /bin/bash -l              
#SBATCH -A snic2021-5-20
#SBATCH -o 3ddna.seal.out                  
#SBATCH -e 3ddna.seal.err                  
#SBATCH -J 3ddna.seal.job                  
#SBATCH -p node -n 10
#SBATCH -t 24:00:00
#SBATCH -D /proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/05_3ddna10X 
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH --mail-type=ALL      

module load bioinfo-tools    
module load lastz            
module load gnuparallel      

CMD=/proj/uppstore2017185/private/wabi/vanessa_cardui/opt/3d-dna/run-asm-pipeline-post-review.sh

conda activate 3ddna

INPUT_SIZE=500

#ROUND=0

ASSEMBLY=/proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/04_juicer10X/reference/10X.supernova.assembly.fasta

MND=/proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/04_juicer10X/aligned/merged_nodups.txt

${CMD} --sort-output -s seal -i ${INPUT_SIZE} -r /proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/05_3ddna10X/10X.supernova.assembly.final.assembly ${ASSEMBLY} ${MND}
