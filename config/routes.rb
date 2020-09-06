Rails.application.routes.draw do
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'top#index'
  	get 'top' => 'top#index'
  	get 'index' => 'home#index'
  resource :home do
	resources :about
	end
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :book_comments,only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end