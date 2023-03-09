$baits = []

File.open(ARGV[0]) do |f1|
	header = ''
	sequence = ''
	while line = f1.gets
		if line[0].chr == '>'
			header = line
		else
			sequence = line
			$baits.push(header + sequence)
		end
	end
end
deleted_baits = ''
for i in 1..ARGV[1].to_i
	chosen = rand($baits.size)
	deleted_baits << $baits[chosen]
	$baits.delete_at(chosen)
	File.open("deleted_baits.fa", 'w') do |f1|
		f1.puts deleted_baits
	end
end
outbaits = $baits.join("")
File.open("retained_baits.fa", 'w') do |f1|
	f1.puts outbaits
end