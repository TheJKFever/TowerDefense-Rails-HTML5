class ProfilesController < ApplicationController
	before_filter :authenticate_user, :only => [:edit, :update, :show]

	# Signup page
	def new
		if is_signed_in?
			redirect_to root_path
		else
			@user = User.new
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "You have successfully registered"
			flash[:color] = "valid"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:notice] = "Invalid Entry"
			flash[:color] = "invalid"
			render "new"
		end  		
	end

	# edit profile page
	def edit
		requires_signed_in
		@user = User.find(params[:id])
	end

	def update
		requires_signed_in
		@user = User.new(user_params)
		if @user.update
			flash[:notice] = "You have successfully updated your profile"
			flash[:color] = "valid"
			redirect_to profil_path
		else
			flash[:notice] = "Invalid Entry"
			flash[:color] = "invalid"
		end  		
		render "edit"
	end

	# profile page
	def show
		requires_signed_in
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
