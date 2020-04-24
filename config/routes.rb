Rails.application.routes.draw do
  root 'home#index'

  resources :employees do 
    collection { post :import }
  end

  resources :students
  get '/send_mail' => 'students#send_mail'



  resources :officers

  resources :images, except: [:edit, :update, :destroy]
  get 'home/users'
end
