Rails.application.routes.draw do
  resources :issues
  post 'receive', to: 'receive#new'
  resources :events
end
