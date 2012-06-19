class OrdersController < ApplicationController

  def new
    puts flash[:notice]
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(params[:order])
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Thank you!"
      redirect_to :action => :new
    else
      render :template => 'orders/new'
    end
  end

end