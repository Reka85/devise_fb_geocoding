Rails.application.routes.draw do

  root to: "flats#index"
  get "/flats/new", to: "flats#new"
  post "flats", to: "flats#create"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
