Rails.application.routes.draw do

  devise_for :users, path: '', :path_names => { sign_in: '/', sign_out: 'sign_out'}, :controllers => { :registrations => :registrations, :omniauth_callbacks => "omniauth_callbacks" }, skip: :registrations
    as :user do
      get "users/cancel", to: "registrations#cancel", as: :cancel_user_registration
      get "users/sign_up", to: "registrations#new", as: :new_user_registration
      get "/users/edit", to: "registrations#edit", as: :edit_user_registration
      post "/users", to: "registrations#create"
      delete "/users", to: "registrations#destroy"
      patch "/users", to: "registrations#update", as: :user_registration
      put "/users", to: "registrations#update"
    end


  root 'devise/sessions#new'

  resources :users do
    resources :appointments
  end

  get 'users/:user_id/money', to: 'users#edit_wallet', as: :edit_user_money
  patch 'users/:user_id/money', to: 'users#update_wallet', as: :update_user_money


  resources :rabbis


end
