Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  patch '/capture/:id', to: 'pokemons#capture', as: 'capture'
  patch '/damage/:id', to: 'pokemons#damage', as: 'damage'
  get '/pokemon/new', to: 'pokemons#new', as: 'pokemons'
  post '/pokemon/new', to: 'pokemons#create'
end
