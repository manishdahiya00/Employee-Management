class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    if session[:user_id]
    Current.user = User.find(session[:user_id])
    end
  end
  def require_user_signed_in
    redirect_to login_path ,alert: "User must be signed in to do this !!"  if Current.user.nil?
  end
end
