require 'FileUtils'
begin
	File.open('Cx_gene_list.txt', 'r') do |seq|
		while line = seq.gets
	 		file = line.delete("\n") + ".nt_ali.fasta"
	  		if FileTest.exist?(file)
	  			FileUtils.move file, 'genes/' + file
	  		end
		end
	end	
end
