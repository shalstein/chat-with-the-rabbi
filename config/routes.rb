Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
                                                          
  root 'welcome#welcome'

  resources :users do
    resources :appointments
  end

  resource :rabbi

end
