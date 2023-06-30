Rails.application.routes.draw do
  get "search", to: "search#index"

  namespace :admin do
    resources :cartridges
    resources :games
  end
end
