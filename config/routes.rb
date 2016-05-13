Rails.application.routes.draw do
  if Rails.env.development?
    get '/rails/mailers' => "rails/mailers#index"
    get '/rails/mailers/*path' => "rails/mailers#preview"
  end

  namespace :admin do
    resources :developments do
      resources :units
      resources :photos, controller: :development_photos
    end
    resources :units do
      resources :plans, controller: :unit_plans
      resources :views, controller: :unit_views
    end
    resources :suburbs
    resources :regions
    resources :development_photos
    resources :development_logos
    root to: "developments#index"
  end

  get 'api/units' => 'api/units#index'
  put 'api/units/:id' => 'api/units#update'
  post 'api/units' => 'api/units#create'
  delete 'api/units/:id' => 'api/units#destroy'
  post 'api/images' => 'api/images#create'
  put 'api/images/:id' => 'api/images#update'
  delete 'api/images/:id' => 'api/images#destroy'
  get 'api/developments/:development_id/units/:id' => 'api/units#show'
  get 'api/developments/:id' => 'api/developments#show'
  get 'api/developments' => 'api/developments#index'
  get 'api/regions' => 'api/regions#index'
  post 'api/enquiries' => 'api/enquiries#create'

  root 'site#show'
  get '/*path' => 'site#show'
end
