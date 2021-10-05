#!/bin/bash/ruby
probes = []
snps_probes = []
outline = ""
File.open("Warbler-baits-120-filtration.txt",'r') do |getcontigs|
	while line = getcontigs.gets
		unless line[0..6] == "Bait(1)"
			line_arr = line.split("\t")
			probe_seq = ">" + line_arr[0] + "\n" + line_arr[14]
			if line[0..6] == "ENSTGUG"
				if line_arr[11] == "pass" and line[3].to_f < 25.0 # Check for quality and repeat masking
					probes.push(probe_seq) 
					outline += probe_seq
				end
			else
				snps_probes.push(probe_seq) if line_arr[11] == "pass" and line[3].to_f < 25.0 # Check for quality and repeat masking
			end
		end
	end
end
total = 10000 - probes.size # Fill in with random acceptable nuclear SNPs
for i in 0 ... total
	select = rand(snps_probes.size)
	outline += snps_probes[select]
	snps_probes.delete_at(select)
end
File.open("Warbler-baits-120-filtration-moderate.fas", 'w') do |outselect|
	outselect.puts outline
end
