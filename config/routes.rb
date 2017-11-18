Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get "/flats/new", to: "flats#new"
  post "flats", to: "flats#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
