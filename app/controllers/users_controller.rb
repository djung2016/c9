class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    upload_image 
    @user.role = "user"
    @user.save
    if @user.valid?
      redirect_to users_path, notice: "Yay!!!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path
  end

  def upload_image
    # read the uploaded file
    file = params[:user][:image]
    if file.present?
      @user.image = Base64.encode64(params[:user][:image].read)
    end
  end

 def user_params
   params.require(:user).permit(:name, :role, :image, :gender, :phone_no, :address, :email, :specialty, :hourlyrate, :password, :iscarepro, :about)
 end


end