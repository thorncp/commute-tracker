Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"
  get "hello" => "home#hello"

  resources :commutes, only: [:index, :create, :update]
end
