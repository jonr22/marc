Marc::Application.routes.draw do
  root to: 'static_pages#home'

  resources :drivers
  resources :driver_divisions
  resources :seasons
  resources :race_classes
  resources :races

  get '/admin', to: 'admin#main'
  get '/about', to: 'static_pages#about'
  get '/links', to: 'static_pages#links'
end
