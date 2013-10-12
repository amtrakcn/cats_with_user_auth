class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:user_name],
    params[:user][:password])

    if !@user.nil?
      login_user!(@user)
      redirect_to cats_url
    else
      flash[:errors] = []
      flash[:errors] << "Your login failed"
      flash[:errors] << "And you suck"
      render :new
    end
  end

  def destroy
    logout_current_user!

    render :new

  end




end
