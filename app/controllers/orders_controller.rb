class OrdersController < ApplicationController

  def new
    @order = Order.new(params[:order])
    @campaign = params[:utm_campaign]
  end
  
  def validate
    @order = Order.new(params[:order])
    if @order.valid?
      render json: { valid: true }
    else
      render json: { valid: false, errors: @order.errors }
    end
  end
  
  def confirm
    @order = Order.new(params[:order])
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      puts "order saved"
      track_page_view("Order Complete","/orders/complete")
      flash[:notice] = "Way to go! Please allow 7 - 10 days for your postcard to arrive."
      redirect_to action: :new
    else
      render template: 'orders/new'
    end
  end

end