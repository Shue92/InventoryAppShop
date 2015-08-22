class OrdersController < ApplicationController

   #before_action :admin_user, only: [:index, :edit, :update]
  
  def new
   @orders = Order.new
  end
  
  def show
    @order =  Order.find(params[:id])
  end
  
  def create
    @orders = Order.new(orders_params)
    if @orders.save
      flash[:success] = "Order has been saved"
      redirect_to @orders
    else
      render 'new'
    end
  end
  
  def edit
    @orders = Order.find(params[:id])
  end
  
  def index
    @order = Order.all
    #@order = Order.paginate(page: params[:page])
  end
  
  def update
    @orders = Order.find(params[:id])
    if @orders.update_attributes(orders_params)
      flash[:success] = "Order updated"
      redirect_to @orders
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
  
   def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
   end
  
end
