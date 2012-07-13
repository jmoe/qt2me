require 'spec_helper'

describe OrdersController do
  
  describe 'routing' do
    
    it { { :get => '/' }.should route_to(controller: 'orders', action: 'new') }
    
    it { { :get => '/orders/new' }.should route_to(controller: 'orders', action: 'new') }

    it { { :get => '/orders/validate' }.should route_to(controller: 'orders', action: 'validate') }

    it { { :post => '/orders/confirm' }.should route_to(controller: 'orders', action: 'confirm') }
    
    it { { :post => '/orders' }.should route_to(controller: 'orders', action: 'create') }

  end
  
end