Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get "/dashboard" => "home#dashboard", as: :dashboard_path
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  # USER ACCOUNT
  get '/account' => 'users#show', as: :account
  # get '/settings' => 'users#edit'

  resources :profiles
  resources :dogs
end
