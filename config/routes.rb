Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      devise_for :users, controllers: { registrations: 'registrations' }
    end
  end
end
