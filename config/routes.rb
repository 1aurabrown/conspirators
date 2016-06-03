Rails.application.routes.draw do
  get 'contact', to: "contact#index"
  root to: 'home#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/favourites', to: "talents#favourites"
  scope 'api/v1' do
    resources :talents do 
      member do
        post :edit_collection
      end
    end
  end
  resources :talents, path: '/', only: [:show, :saved], param: :slug
end
