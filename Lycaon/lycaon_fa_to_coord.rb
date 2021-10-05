begin
    abbrev = ""
    full = ""
    File.open("Lycaon_20000nuclear_SNPs.fa", 'r') do |stuff|
        while line = stuff.gets
            if line[0].chr == ">"
                underscore = 0
                contig = ""
                genbank = ""
                snp = ""
                for i in 1..line.length - 1 #Omit > and \n
                    if line[i].chr == "_"
                        underscore += 1 #Note that the fasta file had to have the contig period put back in
                    else
                        case underscore
                        when 0
                            contig += line[i].chr
                        when 1
                            genbank += line[i].chr
                        when 2
                            snp += line[i].chr
                        end
                    end
                end
                snprange = (snp.to_i - 60).to_s + "-" + (snp.to_i + 59).to_s
                abbrev += contig + ":" + snprange + "\n"
                full += "gnl|WGS:AAEX|" + contig + "|gb|" + genbank + ":" + snprange + "\n"
            end
        end
    end
    File.open("Lycaon_20000nuclear_SNPs_coord.txt", 'w') do |stuff|
        stuff.puts full
    end
    File.open("Lycaon_20000nuclear_SNPs_abbrev.txt", 'w') do |stuff|
        stuff.puts abbrev
    end
end