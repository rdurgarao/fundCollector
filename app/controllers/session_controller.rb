class SessionController < ApplicationController

  def new
  @user = User.new
  end

  def create
    puts params
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
       redirect_to funds_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
