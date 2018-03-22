Rails.application.routes.draw do
  resources :recipes
  resources :users
  get '/recipes/:id/step_by_step', to: 'recipes#step_by_step', as: 'instruction'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
