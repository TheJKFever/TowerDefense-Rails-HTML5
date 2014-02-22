class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [:logout]

	def login
		if is_signed_in?	
			redirect_to root_path
		end
	end

	def login_auth
		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Welcome back #{authorized_user.username}"
			flash[:color] = "valid"
			redirect_to request.env['HTTP.REFERER'] || root_path
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color] = "invalid"
			render "login"
		end  		
	end

	def logout
		requires_signed_in
		session[:user_id] = nil
		redirect_to root_path
	end
end
