begin
    names = []
    File.open("Lycaon_20000nuclear_SNPs.fa", 'r') do |getseqs|
        while line = getseqs.gets
            names.push(line) if line[0].chr == ">"
        end
    end
    outline = ""
    seq = false
    File.open("Lycaon_var.filt_depth.vcf-selected-probes.fa", 'r') do |filtseqs|
        while line = filtseqs.gets
            if seq
                outline += line
                seq = false
            elsif !names.include?(line) and line[0].chr == ">"
                outline += line
                seq = true
            end
        end
    end
    File.open("Lycaon_9908nuclear_SNPs.fa", 'w') do |out|
        out.puts outline
    end
end