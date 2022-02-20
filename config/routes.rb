Rails.application.routes.draw do
  # get 'occurrences/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :occurrences

  root 'occurrences#new'
end
