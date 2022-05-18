# Lycaon  
## Description  
Bait set for population genomics of African wild dogs (*Lycaon pictus*).  
## License  
The software is made available under the Smithsonian Institution [terms of use](https://www.si.edu/termsofuse).  
## Citation  
Parker LD, Campana MG, Quinta JD, Cypher B, Rivera I, Fleischer RC, Ralls K, Wilbert TR, Boarman R, Boarman WI, Maldonado JE. 2022. An efficient method for simultaneous species, individual, and sex identification via in-solution SNP capture of low-quality scat samples. *Molecular Ecology Resources*. 22: 1345-1361. DOI: [10.1111/1755-0998.13552](https://onlinelibrary.wiley.com/doi/abs/10.1111/1755-0998.13552).  
## Scripts  
[lycaon_fa_to_coord.rb](lycaon_fa_to_coord.rb) generates a table of bait names and their reference sequence coordinates for the initial batch of nuclear SNP baits (prior to quality control).  
[lycaon_drop_probes.rb](lycaon_drop_probes.rb) retains generated mitochondrial baits and then randomly selects quality-controlled nuclear SNP baits to fill the final 20,000 bait set.  
[subseq.rb](subseq.rb) identifies the baits that were not included in the initial bait set that could be used to complement the original SNP baits.  
## Baits  
The final bait set is available [here](lycaon_baits.fa).  
