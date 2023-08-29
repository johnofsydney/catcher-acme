Rails.application.routes.draw do
  resources :documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/updates' => 'updates#update'
  # Defines the root path route ("/")
  root "home#index"
end
