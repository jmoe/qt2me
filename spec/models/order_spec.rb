require 'spec_helper'

describe Order do
  
  describe "#process_payment (before_create)" do
    
    let(:payment_token) { 'abc123' }
    let(:sender_email) { 'joe@example.com' }
    let(:order) { FactoryGirl.build(:order, payment_token: payment_token, sender_email: sender_email) }
    
    before(:each) do
      Stripe::Charge.stub!(:create)
    end
    
    it "invokes the Stripe API" do
      Stripe::Charge.should_receive(:create).with(
        :amount => Order::POSTCARD_PRICE,
        :currency => "usd",
        :card => payment_token,
        :description => sender_email
      )
      order.save
    end

    it "updates the amount_charged" do
      order.save
      order.reload
      order.amount_charged.should == Order::POSTCARD_PRICE
    end
    
  end
  
  describe "#recipient_full_address" do
    
    let(:order) { FactoryGirl.build(:order) }

    it { order.recipient_full_address.should == "#{order.recipient_address}, #{order.recipient_city}, #{order.recipient_state} #{order.recipient_postal}" }
    
  end
  
end