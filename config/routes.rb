Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations',
    invitations: 'invitations'
  }

  if Rails.env.development?
    get '/rails/mailers' => "rails/mailers#index"
    get '/rails/mailers/*path' => "rails/mailers#preview"
  end

  namespace :admin do
    resources :developments do
      resources :units
      resources :photos, controller: :development_photos
      resources :videos, controller: :development_videos
    end
    resources :units do
      resources :plans, controller: :unit_plans
      resources :views, controller: :unit_views
    end
    resources :suburbs
    resources :regions
    resources :development_photos
    resources :development_videos
    resources :development_logos
    root to: "developments#index"
  end

  get 'api/units' => 'api/units/index#index'
  put 'api/units/:id' => 'api/units#update'
  post 'api/units' => 'api/units#create'
  delete 'api/units/:id' => 'api/units#destroy'

  post 'api/images' => 'api/images#create'
  put 'api/images/:id' => 'api/images#update'
  delete 'api/images/:id' => 'api/images#destroy'

  post 'api/videos' => 'api/videos#create'
  put 'api/videos/:id' => 'api/videos#update'
  delete 'api/videos/:id' => 'api/videos#destroy'

  get 'api/developments/:development_id/units/:id' => 'api/units#show'
  get 'api/developments/:id' => 'api/developments#show'
  get 'api/developments' => 'api/developments#index'
  get 'api/latest_developments' => 'api/developments#latest'
  get 'api/regions' => 'api/regions#index'
  post 'api/enquiries' => 'api/enquiries#create'
  post 'api/try_it_free' => 'api/try_it_free#create'
  get 'api/auth/is_signed_in' => 'api/auth#is_signed_in?'
  get 'api/invitations' => 'api/invitations#index'
  get 'api/invitations/remove' => 'api/invitations#destroy'

  root 'site#show'
  get '/*path' => 'site#show'
end
