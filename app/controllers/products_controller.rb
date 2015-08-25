class ProductsController < ApplicationController
  
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show] 
  
  def search
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @Products = Product.order("created_at DESC")
    end
  end
  
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
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to @product
    else
      render 'edit'
    end 
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_path
  end

private

    def product_params
      params.require(:product).permit(:name, :price, :description, :quantity, :product_image, :shipping)
    end
   
  
end