Rails.application.routes.draw do
	root 'events#index'
	resources :charges
  	devise_for :users
  	
  	resources :events do
	resources :attendances
	end
  	resources :users, only: [:show, :edit] do
  	resources :avatars, only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
