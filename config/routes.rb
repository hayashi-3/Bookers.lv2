Rails.application.routes.draw do
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'top#index'
  	get 'top' => 'top#index'
  	get 'about' => 'about#about'
  	resources :users
  	resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
end