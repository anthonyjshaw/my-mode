Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'my-styles', to: 'styles#my_styles', as: :my_styles

  get 'liked-styles', to: 'styles#liked_styles', as: :liked_styles
  resources :styles do
    member do
      post 'toggle_favorite', to: "styles#toggle_favorite"
    end

    resources :items, only: %i[new create edit update destroy] do
    end
    member do
    post 'toggle_favorite', to: "styles#toggle_favorite"
  end
  resources :comments, only: %i[create new] do

  end
  resources :replies, only: %i[create new]
  end

  get 'blog_posts', to: 'pages#blog', as: :blog_posts

  resources :blogs, only: %i[new show create edit update destroy]

  # API routes

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :styles, only: %i[index show update destroy create] do
        resources :items, only: %i[create]
        resources :comments, only: %i[create] do
          resources :replies, only: %i[create show index]
        end
      end

      resources :items, only: %i[index show destroy update]
      resources :blogs, only: %i[ index show update destroy create]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
