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

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:product).permit(:name, :price, :description, :quantity, :product_image, :shipping)
    end
   
  
end