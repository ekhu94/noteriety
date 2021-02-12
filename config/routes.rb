Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :notes
  resources :bullet_points
  resources :summaries
  resources :users
  resources :subjects
end
