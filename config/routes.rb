Rails.application.routes.draw do
  
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
    
  namespace :admin do
    resources :genres, only:[:index, :create, :edeit, :update]
  end
  

end
