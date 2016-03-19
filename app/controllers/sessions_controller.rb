class SessionsController < ApplicationController
  skip_before_action :authenticate
  
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to calendar_events_url, notice: "You're now logged-in"
      else
        redirect_to root_url, alert: "Invalid Password"
      end
    else
      redirect_to root_url, alert: "Nobody with that email address"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now logged-out"
  end

end