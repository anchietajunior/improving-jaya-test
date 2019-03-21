Rails.application.routes.draw do
  post 'receive', to: 'events#new'
  get 'issues/:id/events', to: 'events#list'
end
