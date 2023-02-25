class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :forbid_new_guest, only: [:edit, :unsubscribe, :withdraw]
  
  def show
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypage_path, notice: "会員情報の更新が完了しました。"
    else
      render :edit
    end
  end
  
  def index
    @reviews = current_user.reviews
    @tag_list = Tag.all
  end

  def unsubscribe
  end

  def withdraw
    current_user.update_attribute(:is_deleted, true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :is_deleted)
  end
  
  def forbid_new_guest
    if current_user.email == 'aaa@aaa.com'
      flash[:danger] = "ゲストユーザーは編集できません"
      redirect_to mypage_path
    end
  end
  
end
