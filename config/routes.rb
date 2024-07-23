Rails.application.routes.draw do
  resources :documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/updates' => 'updates#update'
  # any POST request to /updates will be handled by the updates method

  # Defines the root path route ("/")
  root "home#index"
end
