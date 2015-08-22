class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
   
  def show
    @product = Product.find(params[:id])
  end
    
  def create
    @product = Product.new(product_params)
        
    if @product.save
        flash[:success] = "The item is saved!"
        redirect_to @product
    else
        render 'new'
    end
    
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

    def product_params
      params.require(:product).permit(:name, :price, :description, :quantity, :product_image, :shipping)
    end
   
  
end