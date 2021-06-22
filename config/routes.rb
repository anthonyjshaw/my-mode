Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :styles, only: %i[index]
  get('about', to: 'pages#about', as: :about)
  get 'my-styles', to: 'styles#my_styles', as: :my_styles
  get 'blog', to: 'pages#blog', as: :blog

  # get "men", to: 'pages#men', as: :men
  # get 'men/:category/', to: "pages#index"
  # get "men/:category/:id", to: 'pages#show', as: :men_item

  # get '/women', to: 'pages#women', as: :women
  # get 'women/:category', to: 'pages#index'
  # get '/women/:category/:id', to: 'pages#show', as: :women_item


  resources :styles do
  resources :items, only: %i[new create edit update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
