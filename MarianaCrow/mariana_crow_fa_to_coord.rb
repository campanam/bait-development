begin
    abbrev = ""
    File.open("Ckubaryi_var.filt.vcf-filtered-probes.fa", 'r') do |stuff|
        while line = stuff.gets
            if line[0].chr == ">"
                underscore = 0
                contig = ""
                snp = ""
                for i in 1..line.length - 1 #Omit > and \n
                    if line[i].chr == "\t"
                        underscore += 1 #Note that the fasta file had to have the contig period put back in
                    else
                        case underscore
                        when 0
                            contig += line[i].chr
                        when 1
                            snp += line[i].chr
                        end
                    end
                end
                snprange = (snp.to_i - 60).to_s + "-" + (snp.to_i + 59).to_s
                abbrev += contig + ":" + snprange + "\n"
            end
        end
    end
    File.open("Ckubaryi_234622SNPs_coords.txt", 'w') do |stuff|
        stuff.puts abbrev
    end
end