class ReviewsController < ApplicationController
  before_action :set_yacht, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.yacht = @yacht
    @review.user = @user
    if @review.save
      redirect_to yacht_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
