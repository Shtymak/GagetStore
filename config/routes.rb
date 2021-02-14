Rails.application.routes.draw do
  resources :products, only: %i[show index] do
      member do
        post :add_to_cart
        delete :remove_from_cart
        patch :change_count_in_cart
      end

      collection do
        get :cart
      end
    end
    resources :orders, only: [:new, :create]
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
