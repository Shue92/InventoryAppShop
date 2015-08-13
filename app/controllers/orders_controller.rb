class OrdersController < ApplicationController
  
  def new
   @order = Order.new
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.new(user_params)
    if @order.save
      flash[:success] = "Order has been saved"
      redirect_to @order
    else
      render 'new'
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
  end
  
  private 
  
  def orders_params
    params.require(:orders).permit(:product_id, :product_name,:selling_price,:quantity_sold,:total_price,
                                   :customer_name,:customer_add,:customer_email,:customer_contact,:customer_payment)
  end
  
end
