Rails.application.routes.draw do
  get "heartbeat" => "heartbeat#index"
  get "hello" => "home#hello"
end
