class Tweet < ActiveRecord::Base
	validates_presence_of :status
	belongs_to :baller
end
