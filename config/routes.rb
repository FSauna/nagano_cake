Rails.application.routes.draw do
    
  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
    get '/' => "homes#top"
  end
  
  scope module: :public do
    root "homes#top"
    get '/about' => "homes#about"
    get "/customers/my_page" => "customers#show"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post '/orders/confirm' => 'orders#confirm' 
    get '/orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :index, :create, :show]
  end
  
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

end
