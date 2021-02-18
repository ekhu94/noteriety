Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :notes
  resource :notes do
    resources :bullet_points
  end
  resources :bullet_points
  resources :summaries
  resources :users, only: [:new, :create]
  resources :subjects
  get '/about', to: 'static#about'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_action'
  post '/logout', to: 'users#logout'
  get '/profile', to: 'users#profile'
end
