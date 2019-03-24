Rails.application.routes.draw do
  resources :study_details
  resources :users
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
