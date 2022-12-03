class Public::UsersController < ApplicationController
  def show
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

  def unsubscribe
  end

  def withdraw
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
