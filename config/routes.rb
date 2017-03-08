Rails.application.routes.draw do
  devise_for :users
  root 'welcome#welcome'

  resources :users do
    resources :appointments
  end

  resource :rabbi

end
