file_data = '/Users/aljerrog/scripts/email.js'
data = File.read(file_data)
data_split = data.split(';')
mail = ""
data_split.each_with_index do |line, index|
	if !line.include?("document")
		object = line.split(' = ')
		if object[1].include?("'")
			value = object[1].gsub("'", '')
		else
			value = object[1].delete("^0-9").to_i.chr
		end
		mail << value if index > 6
	end
end

puts mail