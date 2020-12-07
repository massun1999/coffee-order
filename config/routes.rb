Rails.application.routes.draw do
  resources :filters
  resources :lattes
  post 'callback', to: 'webhook#callback'
end
