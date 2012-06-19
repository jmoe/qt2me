require "spec_helper"

describe OrdersHelper do
  let(:order){FactoryGirl.build(:order)}
  describe "#order_recipient_full_address" do
    it "builds address html" do
      order_recipient_full_address(order).should == 
        %(<div class="recipient-full-address"><p class="address">#{order.recipient_address}</p><p class="city-state-zip">#{order.recipient_city}, #{order.recipient_state} #{order.recipient_postal}</p></div>)
    end
  end
end