class Admin::PostItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @post_item = PostItem.find(params[:id])
    @review = Review.new
  end

  def index
    @post_items = PostItem.page(params[:page]).per(6)
  end
  
  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to admin_post_items_path
  end
end
