Rails.application.routes.draw do
  devise_for :users
	get 'welcome/index'

	get "sign_in" => "authentication#sign_in"
	get "sign_out" => "authentication#sign_out"
	get "sign_up" => "authentication#sign_up"

	post "sign_in" => "authentication#login"
	post "sign_up" => "authentication#register"

	get "articles" => "articles#all"
	
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :users do 
		resources :articles
	end
	resources :articles
	root 'welcome#index'
end
