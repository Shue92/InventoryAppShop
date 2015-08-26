class UsersController < ApplicationController

  def add_role(role_name)
    role = Role.where(name: role_name).first
    self.role = role unless  role.blank?
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "User successfully created!"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:email, :role_id, :password, :password_confirmation)
  end
  
end
