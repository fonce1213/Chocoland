class Public::TagsController < ApplicationController
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
