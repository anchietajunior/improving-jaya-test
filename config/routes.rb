Rails.application.routes.draw do
  post 'receive', to: 'events#new'
  get ':type/:number/events', to: 'events#list'
end
