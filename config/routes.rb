Rails.application.routes.draw do
  root 'home#index'


  resources :officers

  resources :images, except: [:edit, :update, :destroy]
  get 'home/users'
  get 'home/pdfs'

  get '/send_mail' => 'home#send_mail'
end
