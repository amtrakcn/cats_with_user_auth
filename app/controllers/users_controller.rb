class UsersController < ApplicationController
  def new
    render :new
  end
# form password = 'dog'
#
# params[:user][:password]
# params[:user][:username]
#
# User.new(:password => 'dog', username: 'rob')
# User.new(:password_digest => 'dsfhalsdifasdhj2425', username: 'rob')



  def create

    @user = User.new
    @user.user_name = (params[:user][:user_name])
    @user.password= (params[:user][:password])
    login_user!(@user)
    #@user.password = params[:user][:password]


    if @user.save
      redirect_to cats_url
    else
      render :new
    end


  end


end
