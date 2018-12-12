class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.nil?
      redirect_to users_sign_in_path
      return
    end
    if @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_sign_up_path
    end
  end
end
