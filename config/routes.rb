Rails.application.routes.draw do
  devise_for :users, controllers:{registrations: 'registrations',confirmations: 'confirmations'}
  namespace :api do
    namespace :v1 do
      resources :tasks
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      devise_for :users
    end
  end
end
