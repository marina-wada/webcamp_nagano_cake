Rails.application.routes.draw do
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'homes#top'
    resources :admin
  end
end
