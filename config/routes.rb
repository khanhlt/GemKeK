Rails.application.routes.draw do
  get 'game/index'
  get 'gameshousai/home'

  root 'game#index'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
