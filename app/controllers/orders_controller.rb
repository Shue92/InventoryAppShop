class OrdersController < ApplicationController

  load_and_authorize_resource except: [:create]
  
  def index
    @orders = Order.all
  end
  
  def new
   @order = Order.new
  end
  
  def show
    @order =  Order.find(params[:id])
  end
  
  def create
    @order = Order.new(orders_params)
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
    @order = Order.find(params[:id])
    if @order.update(orders_params)
      flash[:success] = "Order updated"
      redirect_to @order
    else
      render 'edit'
    end 
  end
  
  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "Order deleted"
    redirect_to orders_url
  end
  
  private 
  
  def orders_params
    params.require(:order).permit(:product_name,:quantity_sold,:selling_price,:total_price,
                                   :customer_name,:customer_add,:customer_contact,:customer_email,:customer_payment)
  end
  
end
