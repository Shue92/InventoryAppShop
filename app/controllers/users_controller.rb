class UsersController < ApplicationController

  def add_role(role_name)
    role = Role.where(name: role_name).first
    self.role = role unless  role.blank?
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:email, :role_id, :password, :password_confirmation)
  end
  
end
