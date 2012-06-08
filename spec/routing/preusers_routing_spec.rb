require 'spec_helper'

describe PreusersController do

  describe 'routing' do
    
    it "should route GET '/' to index" do
      { :get => '/admin' }.should route_to(:controller => 'preusers', :action => 'index')
    end
    
    it "should route GET '/' to new" do
      { :get => '/' }.should route_to(:controller => 'preusers', :action => 'new')
    end

    it "should route POST '/' to create" do
      { :post => '/' }.should route_to(:controller => 'preusers', :action => 'create')
    end
    
    it "should route GET '/thanks' to post_signup" do
      { :get => '/thanks' }.should route_to(:controller => 'preusers', :action => 'post_create')
    end
    
  end

end
