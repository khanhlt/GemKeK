Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'user_profile/home'
  
  get 'game/index'
  get 'game/detail'
  get 'game/game_list_of_platform'
  get 'game/game_list_of_genre'
  get 'search/index'
  get 'search/advance_search'
  root 'game#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews,          only: [:create, :destroy, :edit, :rate, :show, :update] do
    resources :comments
  end
   post 'reviews_rate' , to: 'reviews#rate'
   resources :likes, only: [:create, :destroy]

  namespace :manage do
    get '/' => 'home#index'
    get 'data' => 'home#show'
    get 'top_reviews' => 'home#top_review'
    get 'new_users' => 'home#new_user'
    get 'search_game' => 'games#search_game'

    resources :games
    resources :genres
    resources :platforms
    resources :reviews
    resources :comments

    resources :users, only: [:show] do
      get "upgrade"
      get "downgrade"
      get "block"
      get "unblock"
      get "search_user"
    end
    
  end
end
