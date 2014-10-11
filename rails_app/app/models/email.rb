class ReadFile < ActiveRecord::Base
	def reader
		file_data = '/Users/aljerrog/scripts/email.js'

  		File.read(file_data) do |file|

     	file.each do |line|
    	   puts line
    	 end
 	 end
end
