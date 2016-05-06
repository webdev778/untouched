Rails.application.routes.draw do
  namespace :admin do
    resources :developments do
      resources :units
    end
    resources :units
    resources :suburbs
    resources :regions
    resources :development_photos
    resources :development_logos
    root to: "developments#index"
  end

  get 'api/units' => 'api/units#index'
  put 'api/units/:id' => 'api/units#update'
  post 'api/units' => 'api/units#create'
  get 'api/developments/:development_id/units/:id' => 'api/units#show'
  get 'api/developments/:id' => 'api/developments#show'
  get 'api/developments' => 'api/developments#index'
  get 'api/regions' => 'api/regions#index'

  root 'site#show'
  get '/*path' => 'site#show'
end
