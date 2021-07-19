Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/reglement', to: 'pages#reglement'
  get '/faq', to: 'pages#faq'
  resources :streams, only: [:index, :show]
end
