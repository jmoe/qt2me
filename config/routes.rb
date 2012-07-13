Qt2me::Application.routes.draw do

  root :to => 'orders#new'
  match '/kitten' => redirect('/?utm_source=experiment&utm_medium=postcard&utm_campaign=kitten')
  
  resources :orders, :only => [:new, :create]

  controller :orders do    
    match '/orders/validate', :action => :validate, :via => :get,  :as => :order_validate
    match '/orders/confirm',  :action => :confirm,  :via => :post, :as => :order_confirm
  end

  match '/:campaign' => redirect('/?utm_source=experiment&utm_medium=postcard&utm_campaign=%{campaign}')
end
