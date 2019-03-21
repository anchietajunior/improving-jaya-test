Rails.application.routes.draw do
  post 'receive', to: 'events#new'
  get ':type/:id/events', to: 'events#list'
end
