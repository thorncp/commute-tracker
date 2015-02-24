Rails.application.routes.draw do
  get "hello" => "home#hello", as: :hello
end
