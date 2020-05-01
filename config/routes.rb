Rails.application.routes.draw do
  root 'home#index'
  
  resources :officers
  resources :images, only: [:index, :create, :show, :new]
  get 'home/users'
  get 'home/pdfs'

  get '/send_mail' => 'home#send_mail'
end
