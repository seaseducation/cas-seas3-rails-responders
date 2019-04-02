Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: :index
  root to: 'posts#index'

  devise_for :users,
      path_names: { sign_in: 'login', sign_out: 'logout' },
      controllers: { omniauth_callbacks: 'metova/omniauth_callbacks', registrations: 'metova/registrations' }


  namespace :api, defaults: { format: 'json' } do
    devise_for :users,
      path_names: { sign_in: 'login', sign_out: 'logout' },
      controllers: { sessions: 'metova/api/sessions' }

    # version 1 do
      resources :posts do
        get :secret, on: :collection
      end
    # end
  end
end
