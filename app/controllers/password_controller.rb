class PasswordController < ApplicationController
  before_action :require_user_signed_in
  def edit
  end
  def update
    if Current.user.update(password_params)
      if params[:user][:password].blank?
        flash[:alert] = "Password field is required."
        return
      end
      if params[:user][:password].length < 8 || params[:user][:password].length.nil?
        flash[:alert] = "Password must be at least 8 characters long."
        render :edit
        return
      end
      flash[:notice] = 'Password successfully updated.'
      redirect_to root_path
      else
    render :edit
    end
  end
  private
  def password_params
    params.require(:user).permit(:password)
  end
end