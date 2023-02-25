class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def top
  end
  
  def show
    @review = Review.find(params[:id])
    @post_tags = @review.tags
    @post_comment = PostComment.new
  end

  def index
    @reviews = Review.all
    #@tag_list = Tag.all
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
