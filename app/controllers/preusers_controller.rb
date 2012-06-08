class PreusersController < ApplicationController
  
  def index
    @preusers = Preuser.all
  end
  
  def new
    @preuser = Preuser.new
  end
  
  def create
    @preuser = Preuser.new(params[:preuser])
    if @preuser.save
      redirect_to :action => :post_create
    else
      render :action => :new
    end
  end
  
  # def post_create
  #   
  # end
  
end
