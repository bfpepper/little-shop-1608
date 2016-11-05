class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You Successfully Logged in!"
      if @user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:danger] = "Email and password don't match"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You Successfully Logged out!"
    redirect_to trips_path
  end
end
