Rails.application.routes.draw do
  
  resources :events do
    resources :expenses, controller: 'events/expenses'
    resources :revenues, controller: 'events/revenues'
  end
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  root to: 'events#index'


end
