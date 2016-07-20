Rails.application.routes.draw do
  get 'notes/about'

  root 'notes#about'
  resources :people
end
