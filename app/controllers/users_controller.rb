class UsersController < ApplicationController
  

  
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @user = User.new
  end
  
   
  def show
    @user = User.find(params[:id])
 
  end
    
  def create
    @user = User.new(user_params)
        
    if @user.save
        flash[:success] = "Welcome Aboard, Matey!"
        redirect_to @user
    else
        render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role_id)
    end
   
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
   

    
end
