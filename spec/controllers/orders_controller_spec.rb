require 'spec_helper'

describe OrdersController do
  
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
  
end
