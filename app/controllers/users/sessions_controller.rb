class Users::SessionsController < Devise::SessionsController
  # ゲストログイン用
  def new_guest
    user = User.guest
    sign_in user # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end
end