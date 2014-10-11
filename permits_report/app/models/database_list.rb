class DatabaseList < ActiveRecord::Base
	self.table_name = 'Database_List'
	# belongs_to :runtime
	validates_presence_of :state, :area_type, :state_abb, :state_full, :dbname, :link, :scripter
	validates_uniqueness_of :state, message: "state should be unique."

	# def self.search(search)
	#   search_condition = "%" + search + "%"
	#   find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
	# end
end
