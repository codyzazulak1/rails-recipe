class ReviewsController < ApplicationController

    before_filter :restrict_access
    before_filter :load_recipe

  def new
    @review = @recipe.reviews.build
    # @review.rating_out_of_ten = 5 #might try adding a word here
  end

  def create
    @review = @recipe.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @recipe, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

end