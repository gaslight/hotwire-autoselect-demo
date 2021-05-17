Rails.application.routes.draw do
  resources :parts do
    collection do
      get '/autosuggest', to: 'parts#autosuggest'
      get '/fetch',       to: 'parts#fetch'
      get '/reset',       to: 'parts#reset'
    end
  end

  root 'parts#index'
end
