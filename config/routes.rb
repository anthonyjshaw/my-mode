Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  # Concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  # Pages routes
  get 'about', to: 'pages#about', as: :about
  get 'my-styles', to: 'styles#my_styles', as: :my_styles
  get 'blog_posts', to: 'pages#blog', as: :blog_posts

  # Styles routes
  get 'liked-styles', to: 'styles#liked_styles', as: :liked_styles
  resources :styles, concerns: :paginatable do
    member do
      post 'toggle_favorite', to: "styles#toggle_favorite"
    end

    # Nested items
    resources :items, only: %i[new create edit update destroy] do
    end
    member do
    post 'toggle_favorite', to: "styles#toggle_favorite"
  end

  # Comments routes
  resources :comments, only: %i[create new] do

  end

  # Replies routes
  resources :replies, only: %i[create new]
  end

  # Blog routes
  resources :blogs, only: %i[new show create edit update destroy]

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show]
      resources :styles, only: %i[index show update destroy create] do
        resources :items, only: %i[create show]
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
