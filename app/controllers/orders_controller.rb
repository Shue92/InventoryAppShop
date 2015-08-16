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
  
  def index
    @order = Order.paginate(page: params[:page])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
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
    params.require(:orders).permit(:product_id, :product_name,:selling_price,:quantity_sold,:total_price,
                                   :customer_name,:customer_add,:customer_email,:customer_contact,:customer_payment)
  end
  
end
