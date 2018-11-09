Rails.application.routes.draw do
  resources :alerts
  resources :comments
  resources :users do
    resources :ffnis
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
