require 'spec_helper'

describe PreusersController do

  let(:email) { 'foo@bar.net' }
  
  context 'index' do
    
    it "should respond successfully" do
      get :index
      response.should be_success
    end
    
    it "should set the preusers assign" do
      get :index
      assigns(:preusers).should_not be_nil
    end
    
  end
  
  context 'new' do
    
    it "should respond successfully" do
      get :new
      response.should be_success
    end

    it "should initialize the preuser assign" do
      get :new
      assigns(:preuser).should_not be_nil
    end
    
  end
  
  context 'create' do
    
    it "should redirect to post_create if the preuser saves" do
      Preuser.any_instance.stub(:save).and_return(true)
      post :create
      response.should redirect_to(:action => :post_create)
    end
    
    it "should create the preuser if it saves" do
      post :create, :preuser => { :email => email }
      Preuser.where(:email => email).should exist
    end
    
    it "should render the new template if the preuser doesn't save" do
      Preuser.any_instance.stub(:save).and_return(false)
      post :create
      response.should render_template('preusers/new')
    end
    
  end
  
  context 'post_create' do
    
    it "should respond successfully" do
      get :post_create
      response.should be_success
    end
    
  end

end
