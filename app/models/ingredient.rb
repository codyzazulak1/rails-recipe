class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	# add validation of name
	



	def self.search(search)
    if search
    where('name LIKE ?', "%#{search}%")
    else
    all
   end
  end

end