class RuntimeController < ApplicationController
	before_action :get_dates, :get_distinct_state
	def index
		@databaselist = DatabaseList.all
		@runtime = Runtime.all
	end

	def get_dates
		if !params[:weeks].blank?
			days = params[:weeks].to_i * 7
		else
			days = 7
		end
		day = 1
		dates = Array.new
		# dates.push Date.today
		begin
			# date = Date.today - day
			date = Date.parse("2014-07-16") - day
			dates.push date
			day +=1
		end while day <= days
		@alldates = dates
	end

	def get_distinct_state
		states = Array.new
		nstates = Array.new
		# @allstates = Runtime.select("state").where("rundate != 0").distinct.order("state ASC")
		@rstates = Runtime.select("state").where("rundate != 0").distinct.order("state ASC")
		@dstates = DatabaseList.select("state")
		@rstates.each do |rstate|
			found = 0
			@dstates.each do |dstate|
				if dstate.state.include?(rstate.state)
					states.push dstate
					found = 1
				end
			end
			nstates.push rstate.state if found == 0
		end
		@allstates = states
		@nmstates = nstates
	end
end


