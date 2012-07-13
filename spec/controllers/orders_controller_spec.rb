require 'spec_helper'

describe OrdersController do
  
  let!(:order){FactoryGirl.build(:order)}
  let!(:paid_order){FactoryGirl.build(:paid_order)}


  describe "#new" do
    
    it "loads" do
      get :new
      response.should be_success
    end
    
    it "sets the campaign assign if utm_campaign paramter is set" do
      campaign = 'test'
      get :new, utm_campaign: campaign
      assigns(:campaign).should == campaign
    end
    
    it "does not set the campaign assign if utm_campaign paramter is not set" do
      get :new
      assigns(:campaign).should be_nil
    end
      
  end

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
  
  describe "#create" do
    it "creates an order complete page view" do
      paid_order.sender_name
      @controller.should_receive(:track_page_view).with("Order Complete","/orders/complete")
      post :create, order: paid_order.attributes
      paid_order.errors.should be_empty      
    end
  end

end
