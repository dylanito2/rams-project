Rails.application.routes.draw do
  devise_for :users
  resources :topics do
    resources :posts do
      resources :replies
    end
  end

  resources :posts do
    resources :replies
  end

  resources :replies

get '/account', to: 'accounts#show', as: 'account_details'
get '/account/edit', to: 'accounts#edit'
post '/account', to: "accounts#create", as: 'accounts'
patch '/account', to: "accounts#update", as: 'account'

root to: 'topics#index', as: '/'

end
