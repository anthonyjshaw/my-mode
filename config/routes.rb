Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/men', to: 'pages#men', as: :men
  Item::ITEM_CATEGORIES.each do |category|
      get ":gender/:category", to: 'pages#show', as: "gender_#{category}".to_sym
      puts "#{category}"
  end

  get '/women', to: 'pages#women', as: :women
  # Item::ITEM_CATEGORIES.each do |category|
  #   get "women/#{category.to_sym}", to: 'pages#show', as: "womens_#{category}".to_sym
  #   puts "#{category}"
  # end


  resources :items, only: %i[index new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
