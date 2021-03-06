Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'publics/registrations',
    sessions: 'publics/sessions'
  }
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources:addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'check'
        patch 'withdrawl'
      end
      collection do
        get 'unsubscribe'
        patch 'withdrawl'
      end
    end
  end

  namespace :admin do
    resources :order_details, only: [:update]
    get '/order_details/:id', to: 'orders#show'
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  devise_for :admin, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
