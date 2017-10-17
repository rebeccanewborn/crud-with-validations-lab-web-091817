Rails.application.routes.draw do
  resources :songs
  get '/register', to: 'songs#new'

end
