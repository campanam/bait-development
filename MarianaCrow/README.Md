# Mariana Crow  
## Description  
Bait set for population genomics of Mariana Crows (*Corvus kubaryi*).  
## License  
The software is made available under the Smithsonian Institution [terms of use](https://www.si.edu/termsofuse).  
## Citation  
Cortes-Rodriguez N, Campana MG, Berry L, Faegre S, Derrickson SR, Ha RR, Dikow RB, Rutz C, Fleischer RC. 2019. Population genomics and structure of the critically endangered Mariana Crow (*Corvus kubaryi*). *Genes*. 10, 187. (https://doi.org/10.3390/genes10030187).  
## Scripts  
[mariana_crow_fa_to_coord.rb](mariana_crow_fa_to_coord.rb) generates a table of bait names and their reference sequence coordinates for the initial batch of nuclear SNP baits (prior to quality control).  
[mariana_crow_drop_probes.rb](mariana_crow_drop_probes.rb) randomly selects quality-controlled 20,000 nuclear SNP baits for the final bait set. *NB: this script was adapted from a previous script for African wild dog baits that included mitochondrial targets. Since no mitochondrial baits were included in this dataset, this portion of the script is irrelevant.*  

## Baits  
The final bait set is available [here](mariana_crow_baits.fa).  
