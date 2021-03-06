Rails.application.routes.draw do
  resources :products
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [:create, :index]
    end
  end
end
