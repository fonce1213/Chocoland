class Public::PostItemsController < ApplicationController
  def top
  end
  
  def new
    @post_item = PostItem.new
  end
end
