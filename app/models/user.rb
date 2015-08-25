class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :role
  
  def has_role?(role_name)
    self.role == Role.where(name: role_name).first
  end
  
  def set_default_user_role
    self.role = Role.where(name: "customer").first
    self.save
  end
  
  def add_role(role_name)
    role =  Role.where(name: role_name).first
    self.role = role unless role.blank?
  end
  
end
