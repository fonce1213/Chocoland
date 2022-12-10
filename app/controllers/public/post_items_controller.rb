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
    @shop.save
    @post_item.shop_id = @shop.id
    if @post_item.save!
      redirect_to post_items_path, notice: "商品を登録しました"
    else
      render :new
    end
  end
  
  def index
    @post_items = PostItem.all
    @post_item = current_user.post_items.new
  end
  
  def show
    @post_item = PostItem.find(params[:id])
    @review = Review.new
  end
  
  def edit
    @post_item = PostItem.find(params[:id])
    @tag_list = @post_item.tags.pluck(:tag_name).join(' ')
    @shop = @post_item.shop
  end
  
  def update
    @post_item = PostItem.find(params[:id])
    @shop = @post_item.shop
    tag_list = params[:post_item][:tag_name].split(nil)
    if @post_item.update(post_item_params) & @shop.update(shop_params)
      @post_item.save_tag(tag_list)
      redirect_to post_item_path(@post_item.id), notice: "更新しました"
    else
      render :edit
    end 
  end
  
  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @post_items = @tag.post_items.all
  end
  
  private
  def post_item_params
    params.require(:post_item).permit(:user_id, :shop_id, :item_name, :review, :price, :evaluation, :item_URL, :is_draft)
  end
  
  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :shop_URL, :email)
  end
end
