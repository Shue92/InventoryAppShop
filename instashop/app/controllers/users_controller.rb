class UsersController < ApplicationController
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
        render 'show'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
   
   
   
  
  def inventory
    @inventory = Inventory.new
    @inventory.save
    flash[:success] = "Product successfully added!"
    redirect_to showproducts_url
  end
   
  def inventory_show
    @inventory = Inventory.find(params[:product_id])
  end
   
   
   
    
end
