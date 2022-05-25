#!/usr/bin/env ruby
class Bait
	attr_accessor :locus, :start, :haplotypes
	def initialize(locus, start, haplotypes)
		@locus = locus
		@start = start
		@haplotypes = haplotypes
	end
end
#-------------------------------
def mean_baits
	baitstot = 0
	for bait in $baits_hash.keys
		baitstot += $baits_hash[bait].haplotypes.size
	end
	$stderr.puts $baits_hash.keys.size.to_s + " sites with mean coverage " + (baitstot.to_f/$baits_hash.keys.size.to_f).to_s + " retained"
end
#-------------------------------
def read_baits
	File.open(ARGV[0], 'r') do |f1|
		while line = f1.gets
			line_arr = line.split("\t")
			if line_arr[10] == "pass" && line_arr[2].to_f == 0.0 && line_arr[3].to_f == 0.0 && line_arr[4].to_i == 0 && line_arr[5].to_f >= -7.0 && line_arr[6].to_i == 1 # Instructions say blast <= 1, but this adds more baits than they report (23)
				bait_arr = line_arr[0].split("-") # All sequences have identical name format, allows some cheating
				locus_region = bait_arr[0..1].join("-") # Mod for elephant SNPs
				if $baits_hash.include?(locus_region)
					$baits_hash[locus_region].haplotypes.push(">" + line_arr[0] + "\n" + line_arr[14]) # sequence has linebreak at end already
				else
					$baits_hash[locus_region] = Bait.new(locus_region, bait_arr[1], [">" + line_arr[0] + "\n" + line_arr[14]])
				end
				$retained_baits += 1
			end
		end
	end
	$stderr.puts $retained_baits.to_s + " baits retained after QC"
	mean_baits
end
#-------------------------------
def drop_probes
	# Drop sites with less than required coveraged
	btmp = $baits_hash.sort_by { |key, value| value.haplotypes.size } # Sort so that lowest coverage samples are removed first
	$baits_hash = btmp.to_h # Sort_by converts to an Enumerable, which operates like an Array. Need to reconvert to hash
	for bait in $baits_hash.keys
		break if $retained_baits <= ARGV[1].to_i
		if $baits_hash[bait].haplotypes.size < ARGV[2].to_i
			$retained_baits -= $baits_hash[bait].haplotypes.size
			$baits_hash.delete(bait)
		end
	end
	$stderr.puts $retained_baits.to_s + " baits retained after removing low coverage sites"
	mean_baits
	# Drop redundant baits to even coverage
	for bait in $baits_hash.keys
		break if $retained_baits <= ARGV[1].to_i
		while $baits_hash[bait].haplotypes.size > 1
			break if $retained_baits <= ARGV[1].to_i
			haplo = $baits_hash[bait].haplotypes[rand($baits_hash[bait].haplotypes.size)]
			$baits_hash[bait].haplotypes.delete(haplo)
			$retained_baits -= 1
		end
	end
	$stderr.puts $retained_baits.to_s + " baits retained after dropping tiling"
	mean_baits
	# Drop random baits if still over limit
	while $retained_baits > ARGV[1].to_i
		site = $baits_hash.keys[rand($baits_hash.keys.size)]
		$baits_hash.delete(site)
		$retained_baits -= 1
	end
	$stderr.puts $retained_baits.to_s + " baits retained after random selection"
	mean_baits
end
#-------------------------------
def write_baits
	for bait in $baits_hash.keys
		for haplo in $baits_hash[bait].haplotypes
			print haplo
		end
	end
end
#-------------------------------
if ARGV[0].nil?
	puts "Usage: ruby elephant_drop_baits.rb <myBaits_stats> <Total baits> <min baits per locus> <RNG Seed [optional]>"
else
	unless ARGV[3].nil?
		srand(ARGV[3].to_i)
	end
	$baits_hash = {}
	$retained_baits = 0
	read_baits
	drop_probes
	write_baits
end