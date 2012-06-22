require 'spec_helper'

describe OrdersController do
  
  describe 'routing' do
    
    it { { :get => '/orders/validate' }.should route_to(controller: 'orders', action: 'validate') }
  end
  
end