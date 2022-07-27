class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @release = Release.find(params[:release_id])
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @release = Release.find(params[:release_id])
    @review.user = current_user
    @review.release = @release
    if @review.save
      @software = Software.find(@release.software_id)
      redirect_to software_path(@software, anchor: "review-#{@review.id}")
    else
      @software = Software.find(@release.software_id)
      render "softwares/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
