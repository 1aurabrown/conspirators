Rails.application.routes.draw do

  get 'contact', to: "contact#index"
  resources :articles, path: '/news', only: [:show, :index], param: :slug
  # get 'news/:slug', to: 'articles#show'
  root to: 'home#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/favourites', to: "talents#favourites"
  resources :talents, path: '/', only: [:show, :saved], param: :slug
  scope 'api/v1' do
    resources :talents do
      member do
        post :edit_collection
      end
    end
    resources :inquiries do
      member do
        post :create
      end
    end
  end
end
