class Auth::UsersController < ApplicationController
  skip_before_action :protected_pages

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to cryptos_path, notice: 'created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
