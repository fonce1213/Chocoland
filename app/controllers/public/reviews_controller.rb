class Public::ReviewsController < ApplicationController
  def top
    @genres = Genre.all
  end
  
  def new
    @post_item = PostItem.find(params[:post_item_id])
    @shop = Shop.find_by(id: @post_item.shop_id)
    @review = Review.new
    @tag = Tag.new
    @tag_list = Tag.all
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @post_item = PostItem.find(params[:post_item_id])
    @review.post_item_id = @post_item.id
    @shop = Shop.find_by(id: @post_item.shop_id)
    @tag_list = Tag.all
    @review.user_id = current_user.id
    tag_list = params[:review][:tag_name].split(nil) # tagをスペースで区切る
    # 投稿ボタンを押下した場合
    if params[:post]
      if @review.save(context: :publicize)
        @review.save_tag(tag_list)
        redirect_to post_items_path, notice: "投稿しました" # redirect_back(fallback_location: root_path)
      else
        render :new
      end
    # 下書きボタンを押下した場合
    else
      if @review.update(is_draft: true)
        @review.attributes = review_params.merge(is_draft: true)
        redirect_to :mypage, notice: "下書きを保存しました"
      else
        render :new, notice: "下書きに失敗しました"
      end
    end
  end
  
  def index
    @reviews = Review.where(is_draft: false)
    @tag_list = Tag.all
  end
  
  def show
    @review = Review.find(params[:id])
    #binding.pry
    @post_tags = @review.tags
    @post_comment = PostComment.new
  end
  
  def edit
    @review = Review.find(params[:id])
    @review_tags = @review.tags  # .pluck(:tag_name).join(' ')
    @post_item = @review.post_item
    @shop = @post_item.shop
    
    @tag_list = Tag.all
    
    
  end
  
  def update
    @review = Review.find(params[:id])
    #@shop = @post_item.shop
    tag_list = params[:review][:tag_name].split(nil)
    
    # 1.下書きレシピの更新(公開)の場合
    if params[:publicize_draft]
      # レシピ公開時にバリデーションを実施
      # reviewの配列を取得し、is_draftをfalseに書き換え
      @review.attributes = review_params.merge(is_draft: false)
      if @review.save(context: :publicize)
        @review.save_tag(tag_list)
        redirect_to post_item_review_path(@review.id), notice: "下書きを公開しました"
      else
        @review.is_draft = true
        render :edit, alert: "下書きを公開出来ませんでした"
      end
    # 2.公開済みreview更新の場合
    elsif params[:update_review]
      @review.attributes = review_params
      if @review.save(context: :publicize)
        @review.save_tag(tag_list)
        redirect_to post_item_review_path(@review.id), notice: "レビューを更新しました"
      else
        render :edit, alert: "更新できませんでした"
      end
    # 3.下書きの更新(非公開)の場合  
    else
      if @review.update(review_params)
        @review.save_tag(tag_list)
        redirect_to review_list_path, notice: "下書きを更新しました"
        #redirect_to post_item_review_path(@review.id), notice: "下書きを更新しました"
      else
        render :edit, alert: "更新できませんでした"
      end
    end
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @reviews = @tag.reviews.all
  end
  
  private
  def review_params
    params.require(:review).permit(:user_id, :post_item_id, :review, :evaluation, :is_draft)
  end
  
  
end
