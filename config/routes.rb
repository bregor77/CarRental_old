Rails.application.routes.draw do
  root "car#index"
  
  resources :cars do
    resources :comments
  end 
end
