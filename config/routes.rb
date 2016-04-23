Rails.application.routes.draw do
  namespace :admin do
    resources :developments
    resources :units
    resources :suburbs
    resources :regions
    resources :development_photos
    resources :development_logos
    root to: "developments#index"
  end

  get 'api/developments/:id' => 'api/developments#show'
  get 'api/developments' => 'api/developments#index'
  get 'api/regions' => 'api/regions#index'
  root 'site#show'
end
