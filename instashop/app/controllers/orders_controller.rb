class OrdersController < ApplicationController
  
  def new
    @orders = Orders.new
  end
  
  def show
  end
end
