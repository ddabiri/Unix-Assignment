#Unix Assignment
---


## File Inspection
Here is a snippet of the codes used for file inspection
```
du -h fang_el_al_genotype snp_position
wc -l fang_el_al_genotype snp_position
wc -c fang_el_al_genotype snp_position
file fang_el_al_genotype snp_position
stat fang_el_al_genotype snp_position
head -1 fang_el_al_genotype snp_position
```
6.7M    fang_et_al_genotypes.txt   |||   49K     snp_position.txt
2783 fang_et_al_genotypes.txt     |||  984 snp_position.txt
11051939 fang_et_al_genotypes.txt ||| 82763 snp_position.txt
fang_et_al_genotypes.txt: ASCII text, with very long lines
snp_position.txt:         ASCII text




##File Processing     
---
###1.   Move header of fang_et_al and snp_position file to a new file 
   
   ```
head -1 fang_et_al_genotypes.txt > maize_genotype.txt 
   ```
   ``` 
   grep -E "(ZMMIL|ZMMLR|ZMMMR)" fang_et_al_genotype.txt >> maize_gentoype.txt
   ```
 First, the header is moved to a new file called Maize_genotype and grep command is used to cut out the interested group and append them to the maize_genoitype file 
 This same process is also done for the teosintine group.
 ```
    head -1 fang_et_al_genotypes.txt> teosine_genotype.txt
 ```
```
   grep -E "(ZMPBA|ZMPIL|ZMPJA)" fang_et_al_genotype.txt >> teosine.txt
```

###2.    Extracting columns of the Genotype  
----
The columns of will be extracted and redirected into a new txt file.
```
cut -f 3-986 maize_genotypes.txt > group_maize_genotypes.txt

```
```
cut -f 3-986 teosinte_genotypes.txt > group_teosinte_genotype.txt
```
For the Snp_position, the interested columns are column 1, 3 and 4 
```
cut -f 1,3,4 snp_position.txt > snp_position_cut.txt
```

###3.  File Transpose 
 The new files for each genotype will be transposed using the script provided in the assignment.

 For Maize genotype         

 ``` 
 awk -f transpose.awk group_maize_genotype.txt > transposed_maize_genotype.txt
 ```
 For teosinte
 ```
awk -f transpose.awk group_teosinte_genotype.txt > transposed_teosinte_genotype.txt
```

###4.   File sorting 
```
sort -k1,1 snp_position_cut.txt > sorted_snp_position_cut.txt
sort -k1,1 transposed_group_maize-genotype.txt > sorted_transposed_group_maize-genotype.txt
sort -k1,1 transposed_group_teosinte-genotype.txt.txt > sorted_transposed_group_teosinte-genotype.txt
```
###5. File Joining 
The aim here is to join the snp_sorted together with teosinte and Maize transposed data respectively 

```
join -1 1 -2 1 -t $'\t' sorted_snp_position_cut.txt sorted_transposed_group_maize-genotype.txt > maize-group_with_snp.txt
join -1 1 -2 1 -t $'\t' sorted_snp_position_cut.txt sorted_transposed_group_teosinte-genotype.txt > teosinte-group_with_snp.txt
```
###6.   Sorting Files by Increasing and Decreasing Positions    
Each line of code  creates a file which includes decreasing and increasing position of the SNPs.    
``` 
awk '$2 ~ /10/ {print}' maize-group_with_snp.txt | sort -k3,3n > maize_chrom10_decreasing.txt && sort -k3,3n maize_chrom10_decreasing.txt > maize_chrom10_increasing.txt
awk '$2 ~ /9/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom9_decreasing.txt && sort -k3,3n maize_chrom9_decreasing.txt > maize_chrom9_increasing.txt
awk '$2 ~ /8/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom8_decreasing.txt && sort -k3,3n maize_chrom8_decreasing.txt > maize_chrom8_increasing.txt  awk '$2 ~ /7/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom7_decreasing.txt && sort -k3,3n maize_chrom7_decreasing.txt > maize_chrom7_increasing.txt
awk '$2 ~ /6/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom6_decreasing.txt && sort -k3,3n maize_chrom6_decreasing.txt > maize_chrom6_increasing.txt awk '$2 ~ /5/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom5_decreasing.txt && sort -k3,3n maize_chrom5_decreasing.txt > maize_chrom5_increasing.txt
awk '$2 ~ /4/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom4_decreasing.txt && sort -k3,3n maize_chrom4_decreasing.txt > maize_chrom4_increasing.txt
awk '$2 ~ /3/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom3_decreasing.txt && sort -k3,3n maize_chrom3_decreasing.txt > maize_chrom3_increasing.txt
awk '$2 ~ /2/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom2_decreasing.txt && sort -k3,3n maize_chrom2_decreasing.txt > maize_chrom2_increasing.txt
awk '$2 ~ /1/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom1_decreasing.txt && sort -k3,3n maize_chrom1_decreasing.txt > maize_chrom1_increasing.txt
awk '$2 ~ /multiple/ {print}' maize-group_with_snp.txt | sort -k3,3nr > maize_chrom_multiple_decreasing.txt && sort -k3,3n maize_chrom_multiple_decreasing.txt > maize_chrom_multiple_increasing.txt
awk '$2 ~ /unknown/ {print}' maize-group_with_snp.txt | sort -k3,3n > maize_chrom_unknown_decreasing.txt && sort -k3,3n maize_chrom_unknown_decreasing.txt > maize_chrom_unkwnown_increasing.txt
```
Same thing was done for teosinte 

### Replacing ? with -

```
 for file in maize_chrom{1..10}_increasing.txt; do     sed 's/?/-/g' "$file" > "${file}_modified"; done
 for file in maize_chrom{1..10}_decreasing.txt; do     sed 's/?/-/g' "$file" > "${file}_modified"; done
 ```
The same process was was done for teosinte 
