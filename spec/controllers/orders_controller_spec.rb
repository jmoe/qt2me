require 'spec_helper'

describe OrdersController do
  
  let!(:order){FactoryGirl.build(:order)}
  let!(:paid_order){FactoryGirl.build(:paid_order)}


  describe "#validate" do
    
    it "responds with true if order is valid" do
      get :validate, order: Factory.build(:order).attributes
      response.should be_success
      response.body.should == { valid: true }.to_json
    end

    it "responds with errors if order is not valid" do
      order = Order.new
      get :validate, order: order.attributes
      order.valid?
      response.should be_success
      response.body.should == { valid: false, errors: order.errors }.to_json
    end

  end
  
  describe "#confirm" do
    it "creates an order confirm page view" do      
      @controller.should_receive(:track_page_view).with("Order Confirm","/orders/confirm")
      post :confirm, order: order.attributes
      order.errors.should be_empty      
    end
  end

  describe "#create" do
    it "creates an order complete page view" do
      paid_order.sender_name
      @controller.should_receive(:track_page_view).with("Order Complete","/orders/complete")
      post :create, order: paid_order.attributes
      paid_order.errors.should be_empty      
    end
  end

end
