# Elephant  
## Description  
Bait set for population genomics of Asian elephants (*Elephas maximus*).  
## License  
The software is made available under the Smithsonian Institution [terms of use](https://www.si.edu/termsofuse).  
## Citation  
* Citation: Prado NA, Armstrong EE, Brown JL, Goldenberg SZ, Leimgruber P, Pearson VR, Maldonado JE, Campana MG. 2023. Genomic resources for Asian (*Elephas maximus*) and African savannah elephant (*Loxodonta africana*) conservation and health research. *Journal of Heredity*. DOI: [10.1093/jhered/esad034](https://doi.org/10.1093/jhered/esad034).  
## Scripts  
[elephant_drop_baits.rb](elephant_drop_baits.rb) removes baits that failed [myBaits (Arbor Biosciences)](https://arborbiosci.com/genomics/targeted-sequencing/mybaits/) quality control, drops SNP sites below a minimum specified bait coverage, downsamples tiled baits, and then randomly selects baits to fill a bait set of specified size.  
## Baits  
The final bait set is available [here](elephant_baits.fa).  
