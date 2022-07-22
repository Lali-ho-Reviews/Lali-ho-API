Rails.application.routes.draw do

  get 's3/direct_post'
  resources :companies do
    resources :reviews
  end

  scope '/auth' do
    post "/signup", to: "users#create"
    post "/signin", to: "users#sign_in"
  end
end
