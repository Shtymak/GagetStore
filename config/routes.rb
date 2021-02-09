Rails.application.routes.draw do
  resources :products, only:[:show, :index] do
    member do
      post :add_to_cart
    end
  end
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
