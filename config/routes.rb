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

  get 'api/units' => 'api/units#index'
  get 'api/developments/:development_id/units/:id' => 'api/units#show'
  get 'api/developments/:id' => 'api/developments#show'
  get 'api/developments' => 'api/developments#index'
  get 'api/regions' => 'api/regions#index'
  root 'site#show'
end
