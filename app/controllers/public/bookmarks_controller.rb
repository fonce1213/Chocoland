class Public::BookmarksController < ApplicationController
  
  def create
    post_item = PostItem.find(params[:post_item_id])
    bookmark = current_user.bookmarks.new(post_item_id: post_item.id)
    bookmark.save
    redirect_to post_item_path(post_item)
  end
  
  def destroy
    post_item = PostItem.find(params[:post_item_id])
    bookmark = current_user.bookmarks.find_by(post_item_id: post_item.id)
    bookmark.destroy
    redirect_to post_item_path(post_item)
  end
  
end
