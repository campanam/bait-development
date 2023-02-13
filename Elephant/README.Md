# Elephant  
## Description  
Bait set for population genomics of Asian elephants (*Elephas maximus*).  
## License  
The software is made available under the Smithsonian Institution [terms of use](https://www.si.edu/termsofuse).  
## Citation  
Prado NA, Armstrong EE, Brown JL, Goldenberg SZ, Leimgruber P, Pearson VR, Maldonado JE, Campana MG. 2023. New genomic tools for Asian (*Elephas maximus*) and African savannah elephant (*Loxodonta africana*) health and conservation. *bioRxiv*. DOI: [10.1101/2023.02.10.528067](https://doi.org/10.1101/2023.02.10.528067).  
## Scripts  
[elephant_drop_baits.rb](elephant_drop_baits.rb) removes baits that failed [myBaits (Arbor Biosciences)](https://arborbiosci.com/genomics/targeted-sequencing/mybaits/) quality control, drops SNP sites below a minimum specified bait coverage, downsamples tiled baits, and then randomly selects baits to fill a bait set of specified size.  
## Baits  
The final bait set is available [here](elephant_baits.fa).  
