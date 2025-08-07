Rails.application.routes.draw do
  post '/signup', to: 'auth#signup'
  post '/login', to: 'auth#login'

  resources :file_uploads, only: [:index, :create, :destroy]
  get '/public/:slug', to: 'file_uploads#public'
end
