Rails.application.routes.draw do
  namespace :admin do
    resources :cartridges
    resources :games
  end
end
