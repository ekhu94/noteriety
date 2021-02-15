Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :notes
  resources :bullet_points
  resources :summaries
  resources :users, only: [:new, :create]
  resources :subjects
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_action'
  post '/logout', to: 'users#logout'
end
