class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	# add validation of name
	
end
