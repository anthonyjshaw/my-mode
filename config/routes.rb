Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'my-styles', to: 'styles#my_styles', as: :my_styles
  get 'blog', to: 'pages#blog', as: :blog

  get 'liked-styles', to: 'styles#liked_styles', as: :liked_styles
  resources :styles do
    resources :items, only: %i[new create edit update]
  end

  # API routes

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :styles, only: %i[ index show update destroy create]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
