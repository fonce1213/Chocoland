class Public::PostItemsController < ApplicationController
  before_action :authenticate_user!
  
  def top
  end
  
  def new
    @post_item = PostItem.new
    @shop = Shop.new
  end
  
  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    shop = Shop.find_by(shop_name: shop_params[:shop_name], address: shop_params[:address])
    if shop.present?
      @post_item.shop_id = shop.id
    else
      @shop = Shop.new(shop_params)
      @shop.save
      @post_item.shop_id = @shop.id
    end
    if @post_item.valid?
      @post_item.save
      redirect_to @post_item
      # post_items_path, notice: "商品を登録しました"
    else
      flash.now[:notice] = "同一商品が既に登録されています"
      render :new
    end
  end
  
  def index
    @post_items = PostItem.page(params[:page]).per(6)
    @post_item = current_user.post_items.new
  end
  
  def show
    @post_item = PostItem.find(params[:id])
    @review = Review.new
  end
  
  def edit
    @post_item = PostItem.find(params[:id])
    @shop = @post_item.shop
  end
  
  def update
    @post_item = PostItem.find(params[:id])
    @shop = @post_item.shop
    if @post_item.update(post_item_params) & @shop.update(shop_params)
      redirect_to post_item_path(@post_item.id), notice: "更新しました"
    else
      render :edit
    end 
  end
  
  # 絞り込み検索
  def search
    @post_items = PostItem.includes(:shop, :genre).order(created_at: :desc).page(params[:page]).per(12)
    @post_items = @post_items.joins(:shop).where('shops.address LIKE ?', "%#{params[:prefecture]}%") if params[:prefecture].present?
    @post_items = @post_items.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    if @post_items.blank?
      flash.now[:alert] = "検索結果がありません。"
    end
    render :index
  end
  
  def bookmark_items
    @post_items = PostItem.where(id: current_user.bookmarks.pluck(:post_item_id))
  end
  

  
  private
  def post_item_params
    params.require(:post_item).permit(:user_id, :shop_id, :genre_id, :item_name, :price, :item_URL, :item_image)
  end
  
  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :shop_URL, :email)
  end
end
