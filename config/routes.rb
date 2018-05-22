Rails.application.routes.draw do
  resources :records do
    resources :tags
  end

  devise_for :users

  get "search", to: "explore#search"

  root to: "explore#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
