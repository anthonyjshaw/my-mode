Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#search'
  get '/men', to: 'pages#men', as: :men do

  end
  get '/women', to: 'pages#women', as: :women do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
