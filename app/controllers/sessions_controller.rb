class SessionsController < ApplicationController
  before_action :disallow_user, only: [:new, :create]
  skip_before_filter :require_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to :root
    else
      flash[:danger] = "Incorrect email / password combo"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to :root
  end
end
