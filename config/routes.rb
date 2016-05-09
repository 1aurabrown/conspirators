Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :talents, path: '/', only: [:show, :saved], param: :slug
  scope 'api/v1' do
    resources :talents do 
      member do
        post :add_to_collection
      end
    end
  end
end
