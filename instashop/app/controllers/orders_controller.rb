class OrdersController < ApplicationController
  
  def new
    @order = Orders.new
  end
  
  def show
    @order = Orders.find(params[:id])
  end
end
