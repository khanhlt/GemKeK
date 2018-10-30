Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'user_profile/home'
  get 'login/home'
  get 'game/index'
  get 'game/detail'
  get 'game/game_list_of_platform'
  get 'game/game_list_of_genre'
  get 'gameshousai/home'
  get 'search/index'
  get 'search/advance_search'
  root 'game#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :reviews,          only: [:create, :destroy, :rate, :show, :update] do
    resources :comments
  end
   post 'reviews_rate' , to: 'reviews#rate'
  #get 'reviews_show', to: 'reviews#show'
   resources :likes, only: [:create, :destroy]

  namespace :manage do
    get '/' => 'home#index'
    get 'data' => 'home#show'
    resources :users  do
      get "block"
      get "unblock"
    end
    
  end
end
