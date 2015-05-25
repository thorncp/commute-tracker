Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"

  post "departure" => "home#depart"
  post "arrival" => "home#arrive"

  resources :commutes, only: [:destroy]

  root to: "home#index"
end
