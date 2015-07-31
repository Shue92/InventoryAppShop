class ProductsController < ApplicationController
  
  def new
    @product = Product.new
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

private

    def product_params
      params.require(:product).permit(:name, :price, :description, :quantity)
    end
   
  
end