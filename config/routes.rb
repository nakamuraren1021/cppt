Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :posts do
	  resource :favorites, only: [:create, :destroy]
	  resource :post_comments, only: [:create, :destroy]
  end
  get 'users/top' => 'users#top'
  get 'users/exit' => 'users#exit'
  resources :users
  resources :rankings
  get'/search' => 'concerns#search'
  resources :concerns do
    resource :concern_comments, only:[:create, :destroy]
  end
  get 'tags/:tag', to: 'tags#index', as: :tag
  resources :recommendations
end
