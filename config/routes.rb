Rails.application.routes.draw do
  get "home/index"
  get 'perfil', to: 'users#show', as: 'user_profile'
  devise_for :users, controllers: {
    registrations: 'registrations' # Aponta para seu controller personalizado
  }
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :create] 
      
    end
  end
  root to: "home#index"  # Substitui a página padrão do Rails
end