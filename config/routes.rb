Rails.application.routes.draw do
  get 'foo/bar'
  get 'foo/baz'
  root'static_pages#home'
  get '/help' ,to: 'static_pages#help'
  get '/about' ,to: 'static_pages#about'
  get '/contact' ,to: 'static_pages#contact'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup' ,to: 'users#new'
end
