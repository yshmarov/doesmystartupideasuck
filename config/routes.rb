Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "home#index"
  get 'terms_of_service', to: 'home#terms_of_service'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'home/index'
  resources :ideas do
    member do
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
    get :fresh, :top, :mine, on: :collection
  end
  resources :comments
  resources :cofounders
  resources :tags, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
