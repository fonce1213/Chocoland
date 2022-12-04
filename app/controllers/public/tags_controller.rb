class Public::TagsController < ApplicationController
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to new_post_item_path
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
