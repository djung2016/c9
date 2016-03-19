class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :current_user
  
  def authenticate
    if current_user.nil?
      render text: "Not authorized!"
      return
    end
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin_role
    User.find_by(id: session[:user_id], role: "admin")
  end

  def authenticate_admin
    if admin_role.nil?
      render text: "Not authorized!"
      return
    end
  end
end
