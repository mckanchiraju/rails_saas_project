Rails.application.routes.draw do
  devise_for :users
  #Root or '/' routes to home.html.erb
  root to: 'pages#home'
  #about or '/about' routes to about.html.erb
  get 'about', to: 'pages#about'
  #resources creates 
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
