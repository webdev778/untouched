Rails.application.routes.draw do
  get 'api/developments' => 'api/developments#index'
  root 'site#show'
end
