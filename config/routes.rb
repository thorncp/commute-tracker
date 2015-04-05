Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"

  post "departure" => "home#depart"
  post "arrival" => "home#arrive"

  root to: "home#index"
end
