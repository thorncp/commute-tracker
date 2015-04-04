Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"

  resources :commutes, only: [:index, :create, :update]

  root to: "home#hello"
end
