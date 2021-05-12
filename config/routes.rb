Rails.application.routes.draw do
  resources :parts

  root 'parts#index'
end
