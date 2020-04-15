Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: :index do
    collection { post :import }
  end

  resources :employees do 
    collection { post :import }
  end

  resources :students
  get '/send_mail' => 'students#send_mail'

  resources :images

  resources :officers

end
