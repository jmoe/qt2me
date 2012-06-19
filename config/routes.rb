Qt2me::Application.routes.draw do

  resources :orders, :only => [:new, :create]

  controller :orders do
    match '/orders/confirm', :action => :confirm,  :via => :post, :as => :order_confirm
  end

  controller :preusers do
    match '/admin',  :action => :index
    match '/',       :action => :new,         :via => :get
    match '/',       :action => :create,      :via => :post
    match '/thanks', :action => :post_create
  end
end
