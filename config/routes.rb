Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/:slug', to: 'talents#show'
end
