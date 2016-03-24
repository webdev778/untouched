Rails.application.routes.draw do
  namespace :admin do
    resources :developments
resources :units

    root to: "developments#index"
  end

  get 'api/developments' => 'api/developments#index'
  root 'site#show'
end
