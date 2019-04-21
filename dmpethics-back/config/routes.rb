Rails.application.routes.draw do
  resources :checklists
  resources :study_details
  resources :users
  resources :answers
  resources :smwapi
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
