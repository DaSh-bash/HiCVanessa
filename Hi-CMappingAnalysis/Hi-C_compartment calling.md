## Compartment calling of Hi-C maps

`cd /proj/uppstore2017185/b2014034_nobackup/Dasha/HiCScaffolding_Vanessa/08_CompartmCalling`

`cp pacbio.prim.assembly.final.hic ../08_CompartmCalling/
cp pacbio.prim.assembly.polished.hic ../08_CompartmCalling/`


`module load BEDTools/2.29.2`

bin_size=250000
bedtools makewindows -g chrom.sizes -w ${bin_size} -s ${bin_size} > pacbio.prim.assembly.final.250k.bins

mkdir -p EIG
hic_file="pacbio.prim.assembly.final.hic"
out_name="pacbio.prim.assembly.final.250k"

chr_list=ʽcut -f1 chrom.sizesʽ - didn't work

cut -f1 chrom.sizes > chr_list.out


java -jar /Users/dariashipilina/Documents/GitHub/juicer_tools_1.22.01.jar -p \
eigenvector KR pacbio.prim.assembly.final.hic LR999924.1 BP 250000 \
EIG/pacbio.prim.assembly.final_KR_250k_eigen_LR999924.1.txt


/Users/dariashipilina/Desktop/CompartmentCalling/straw/python/straw

#### Script for looped calculation:

##loop start##
for chr in chr_list.out; do
#if [ "$chr" != "chrM" ]; then
#1
java -jar juicer_tools_linux_0.8.jar -p \
eigenvector KR pacbio.prim.assembly.final.hic $chr BP 250000 \
EIG/pacbio.prim.assembly.final_KR_250k_eigen_$chr.txt
#2
grep $chr$'\t' male.mm9.250k.bins \
| paste - EIG/mES-rep1_30_KR_250k_eigen_$chr.txt \
| awk '{OFS="\t"}{if ($4 != "NaN"){print}}' \
> EIG/mES-rep1_30_KR_250k_eigen_$chr.bg
bedGraphToBigWig EIG/mES-rep1_30_KR_250k_eigen_$chr.bg \
male.mm9.chrom.sizes EIG/mES-rep1_30_KR_250k_eigen_$chr.bw

fi
done
##loop end##


java -jar /Users/dariashipilina/Documents/GitHub/juicer_tools_1.22.01.jar arrowhead pacbio.prim.assembly.final.hic test.bed
