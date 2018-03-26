Rails.application.routes.draw do
  root to: 'recipes#index'
  devise_for :users
  resources :users, only: [:show]
  resources :recipes
  get '/recipes/:id/step_by_step', to: 'recipes#step_by_step', as: 'instruction'
end
