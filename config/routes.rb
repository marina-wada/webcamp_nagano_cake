Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  devise_for :customers
  devise_for :admin, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
