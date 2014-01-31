class Recipe < ActiveRecord::Base

	has_many :reviews
  has_many :ingredients

	validates :title,
	    presence: true

  validates :directions,
    presence: true

  validates :cook_time,
    numericality: { only_integer: true }

  validates :ingredients,
    presence: true

  validates :poster_image_url,
    presence: true


  def review_average
    if reviews.size == 0
      return "(unrated) "
    else
     reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end
  
end