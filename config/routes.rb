Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#welcome'

  resources :users do
    resources :appointments
  end

  resource :rabbis

end
