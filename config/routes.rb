Rails.application.routes.draw do
  get '/users/:username', to: "users#show"
  get '/companies/search/:name', to: "companies#search"
  get '/companies/category/:category', to: "companies#search_category"

  resources :companies do
    resources :reviews
  end

  scope '/auth' do
    post "/signup", to: "users#create"
    post "/signin", to: "users#sign_in"
  end
end
