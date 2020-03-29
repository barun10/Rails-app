Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html   
  root 'home#index'

  resources :users do
    collection { post :import }
  end

  resources :employees do 
    collection { post :import }
  end

  resources :students
  get '/send_mail' => 'students#send_mail'
end
