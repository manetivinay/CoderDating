class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Welcome back'
        redirect_to users_path
      else
        flash[:error] = 'password is worng'
        redirect_to login_path
      end
    else
      flash[:error] = 'Email not found'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash[:error] = 'Logged out.'
  end
end

