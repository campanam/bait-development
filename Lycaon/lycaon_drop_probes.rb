begin
    mito_probes = []
    nuclear_probes = []
    outline = "fragment_bait-position\t40.0-60.0\t62.5\t65.0\t67.5\t70.0\t>70.0\tselected\n"
    File.open("probes-relaxed-2-concat.txt", 'r') do |getcontigs|
        while line = getcontigs.gets
            if line[-5..-2] == "true"
                probe = ""
                count = 0
                while line[count].chr != "\t"
                    probe += line[count].chr
                    count += 1
                end
                if probe[0..4] == "cont3"
                    nuclear_probes.push([probe, line]) #Include stats for output
                else
                    mito_probes.push([probe, line]) #Include stats for output
                end
            end
        end
    end
    selected_probes = []
    for probe in mito_probes
        outline += probe[1]
        selected_probes.push(probe[0])
    end
    total = 20000 - selected_probes.size #Keep all mitochondrial probes, fill in with random acceptable nuclear SNPs
    for i in 0...total # Triple dots because including zero
        select = rand(nuclear_probes.size)
        outline += nuclear_probes[select][1]
        selected_probes.push(nuclear_probes[select][0])
        nuclear_probes.delete_at(select)
    end
    File.open("probes-relaxed2-selected.txt", 'w') do |outselect|
        outselect.puts outline
    end
    outfasta = ""
    writeseq = false
    File.open("probes_concat.fas" , 'r') do |getprobes|
        while line = getprobes.gets
            if line[0].chr == ">" and selected_probes.include?(line[1..-2])
                outfasta += line
                writeseq = true
            elsif writeseq
                outfasta += line
                writeseq = false
            end
        end
    end
    File.open("probes-relaxed2-selected.fas", 'w') do |out|
        out.puts outfasta
    end
end