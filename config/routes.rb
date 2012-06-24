Qt2me::Application.routes.draw do

  root :to => 'orders#new'
  
  resources :orders, :only => [:new, :create]

  controller :orders do    
    match '/orders/coming_soon', :action => :coming_soon, :via => :get,  :as => :order_coming_soon
    match '/orders/validate', :action => :validate, :via => :get,  :as => :order_validate
    match '/orders/confirm',  :action => :confirm,  :via => :post, :as => :order_confirm
  end
end
