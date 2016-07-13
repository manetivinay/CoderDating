class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:sucess] = "Successful login";
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :image_url)
  end
end
