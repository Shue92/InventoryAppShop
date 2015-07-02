class InventoriesController < ApplicationController
  def new
    @inventories = Inventory.new
  end

  def create
     @inventories = Inventory.create(user_params)
        
    if @inventories.save
        flash[:success] = "Product Successfully Added!"
        redirect_to @inventories
    else
        render 'new'
    end
  end
  
  def show
    @inventories = Inventory.find(params[:id])
  end
  
  def update
  end
  
  private

  def user_params
    params.require(:inventory).permit(:product_id, :product_name, :unit_price, :selling_price, :original_quantity,:quantity_sold,:quantity_left)
  end
  
  
  
  
end
