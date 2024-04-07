class RegistrationController < ApplicationController
  def new
    if Current.user
      redirect_to root_path
  end
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    existing_user = User.find_by(email: @user.email)

    if existing_user
      flash[:alert] = "Account already exists"
      redirect_to login_path
    else
      if params[:user][:name].blank? || params[:user][:email].blank? || params[:user][:password].blank?
        flash[:alert] = "All fields are required."
        render :new
        return
      end
      if params[:user][:password].length < 8 || params[:user][:password].length.nil?
        flash[:alert] = "Password must be at least 8 characters long."
        render :new
        return
      end
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Account created successfully!"
        redirect_to root_path
      else
        flash[:alert] = "All fields are required."
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
