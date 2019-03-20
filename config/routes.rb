Rails.application.routes.draw do
  post 'receive', to: 'receive#new'
  resources :events
end
