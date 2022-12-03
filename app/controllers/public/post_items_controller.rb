class Public::PostItemsController < ApplicationController
  def top
  end
  
  def new
    @post_item = PostItem.new
    @shop = Shop.new
  end
  
  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    @shop = Shop.new(shop_params)
    @shop.save!
    @post_item.shop_id = @shop.id
    @post_item.save!
    redirect_to post_items_path
  end
  
  def index
    @post_items = PostItem.all
  end
  
  def show
    @post_item = PostItem.find(params[:id])
    @post_comment = PostComment.new
  end
  
  private
  def post_item_params
    params.require(:post_item).permit(:user_id, :shop_id, :item_name, :review, :price, :evaluation, :item_URL, :is_draft)
  end
  
  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :shop_URL, :email)
  end
end
