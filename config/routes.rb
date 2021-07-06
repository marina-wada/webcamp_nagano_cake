Rails.application.routes.draw do
  namespace :admin do
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
    resource :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  devise_for :customers
  devise_for :admin, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'homes#top'
  end
end
