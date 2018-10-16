Rails.application.routes.draw do
  get 'user_profile/home'
  get 'login/home'
  get 'game/index'
  get 'game/detail'
  get 'gameshousai/home'

  root 'game#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews,          only: [:create, :destroy, :edit, :new, :update]
end
