Rails.application.routes.draw do

  resources :companies

  scope '/auth' do
    post "/signup", to: "users#create"
    post "/signin", to: "users#sign_in"
  end
end
