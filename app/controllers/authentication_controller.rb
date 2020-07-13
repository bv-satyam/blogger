class AuthenticationController < ApplicationController
	def sign_in
		if session[:user_id]
			redirect_to :root
		end
		@user = User.new
	end

	def login
		email = params[:user][:email]
		password = params[:user][:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect_to :controller => 'users', :action => 'show', :id => user.id
		else
			render :action => "sign_in"
		end
	end

	def sign_out
		session[:user_id] = nil
		redirect_to :root
	end

	def sign_up
		session[:user_id] = nil
		@user = User.new
	end

	def register
		user = User.new(auth_params)
		session[:user_id] = 100
		if user.valid?
			user.save
			session[:user_id] = user.id
			redirect_to :root
		else
			render :action => "sign_up"
		end
	end

	private
		def auth_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end
end