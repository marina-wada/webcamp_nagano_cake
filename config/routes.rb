Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'publics/registrations',
    sessions: 'publics/sessions'
  }
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end

  namespace :admin do
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
