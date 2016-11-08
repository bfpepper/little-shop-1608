class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Logged in as #{@user.name}"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:danger] = "You have failed to create an account. Please try again!"
      redirect_to new_user_path
    end
  end

  def show
    if current_user 
      @user = current_user
    else
      render file: 'public/404', layout: false
    end
  end

  def edit
    render file: 'public/404', layout: false unless current_user && current_user == @user
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You have successfully updated your account info"
      redirect_to dashboard_path
    else
      render :edit
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
