Qt2me::Application.routes.draw do

  controller :preusers do
    match '/admin',  :action => :index
    match '/',       :action => :new,         :via => :get
    match '/',       :action => :create,      :via => :post
    match '/thanks', :action => :post_create
  end
end
