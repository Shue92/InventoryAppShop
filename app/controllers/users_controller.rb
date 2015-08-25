class UsersController < ApplicationController

  def add_role(role_name)
    role = Role.where(name: role_name).first
    self.role = role unless  role.blank?
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
