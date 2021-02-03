Rails.application.routes.draw do
  resources :products, only:[:show, :index]
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
