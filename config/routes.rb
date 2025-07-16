Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :create] 
      resources :users, only: [:create, :show]
    end
  end
end