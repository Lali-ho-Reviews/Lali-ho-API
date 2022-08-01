Rails.application.routes.draw do
  get '/users/:username', to: "users#show"

  resources :companies do
    resources :reviews
  end

  scope '/auth' do
    post "/signup", to: "users#create"
    post "/signin", to: "users#sign_in"
    post "/update", to: "users#update"
  end
end
