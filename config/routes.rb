Rails.application.routes.draw do
  root to: 'orders#new'

  resources :orders, only: %i[index new create]

  namespace :kitchen do
    resources :orders, only: %i[create]
  end
end
