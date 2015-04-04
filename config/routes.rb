Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"

  resources :commutes, only: [:index, :create, :update]

  post "departure" => "home#depart"
  post "arrival" => "home#arrive"

  root to: "home#index"
end
