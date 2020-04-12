class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == 'Admin' && params[:password] == '1234'
      session[:username] = 'Admin'
      redirect_to root_path
    else
      flash[:danger] = 'Login Failed'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:username)
    redirect_to root_path
  end
end
