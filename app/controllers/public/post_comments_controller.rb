class Public::PostCommentsController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
