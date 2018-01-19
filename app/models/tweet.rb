class Tweet < ApplicationRecord
	belongs_to :keyword
	
	validates :text, uniqueness: true, on: :create

end
