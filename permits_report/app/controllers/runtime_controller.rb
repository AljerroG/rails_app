class RuntimeController < ApplicationController
	before_action :get_dates, :get_distinct_state
	def index
		@databaselist = DatabaseList.all
		@runtime = Runtime.all
	end

	def get_dates
		day = 1
		dates = Array.new
		dates.push Date.today
		begin
			date = Date.today - day
			# date = Date.parse("2014-07-16") - day
			dates.push date
			day +=1
		end while day <= 7
		@alldates = dates
	end

	def get_distinct_state
		@dstates = Runtime.select("state").where("rundate != 0").distinct.order("state ASC")
	end
end
