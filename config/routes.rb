Rails.application.routes.draw do
	get 'welcome/index'

	get "sign_in" => "authentication#sign_in"
	get "sign_out" => "authentication#sign_out"
	get "sign_up" => "authentication#sign_up"

	post "sign_in" => "authentication#login"
	post "sign_up" => "authentication#register"
	
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :users do 
		resources :articles
	end
	
	root 'welcome#index'
end
