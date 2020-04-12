class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = 'Admin'
    redirect_to root_path
  end

  def destroy
    session.delete(:username)
    redirect_to root_path
  end
end
