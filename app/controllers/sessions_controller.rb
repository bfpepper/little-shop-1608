class SessionsController < ApplicationController

  def new
  end

  def create
    if login_with_oauth?(params)
      response = Faraday.post("https://github.com/login/oauth/access_token?client_id=65a45e10bd1029b7280e&client_secret=ca34fba6965c2db07142a2e86ba84d429ece7e5d&code=#{params["code"]}")
      oauth(response)
      redirect_to dashboard_path
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "You Successfully Logged in!"
        determine_user_type(user)
      else
        flash[:danger] = "Email and password don't match"
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You Successfully Logged out!"
    redirect_to trips_path
  end

  private

  def oauth(response)
    token = response.body.split(/\W+/)[1]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)
    user          = User.find_or_create_by(id: auth["id"])
    user.name     = auth["name"]
    user.id       = auth["id"]
    user.token    = auth["token"]
    user.email    = auth["login"]
    user.password = auth["avatar_url"]
    user.save

    session[:user_id] = user.id
  end

  def determine_user_type(user)
    if user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def login_with_oauth?(params)
    params.include?("code")
  end

end
