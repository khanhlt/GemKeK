Rails.application.routes.draw do
  get 'login/home'
  get 'gameshousai/home'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
