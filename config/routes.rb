Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  root 'users#index'
  devise_for :users, :controllers => { :registrations => "registrations" }


resources :users do
    resources :products
    resources :designs

  end

  get 'users/:id/preview' => 'users#preview', as: 'user_preview'

  get '/:id' => 'users#store', as: 'user_store'  , constraints: { subdomain: 'store' }

end
