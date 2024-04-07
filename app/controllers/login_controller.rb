class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if params[:email].blank? || params[:password].blank?
      flash[:alert] = "Email and password are required."
      render :new
      return
    end
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successful!"
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out Successfully!"
    redirect_to root_path
  end
end
