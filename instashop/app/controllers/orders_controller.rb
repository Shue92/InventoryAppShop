class OrdersController < ApplicationController
  
  def new
   @order = Order.new
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def create
  end
  
  def update
  end
  
  private 
  
  def orders_params
    params.require(:orders).permit(:product_id, :product_name,:selling_price,:quantity_sold,:total_price,
                                   :customer_name,:customer_add,:customer_email,:customer_contact,:customer_payment)
  end
  
end
