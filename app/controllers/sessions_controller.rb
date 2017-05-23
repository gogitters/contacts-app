class SessionsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      flash[:success] = "Hooray you're logged in"
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:warning] = "Incorrect email or password"
      reirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to "/login"
  end
end
