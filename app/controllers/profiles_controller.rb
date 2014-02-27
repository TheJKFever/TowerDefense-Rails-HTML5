class ProfilesController < ApplicationController
	before_filter :requires_signed_in, :only => [:edit, :update, :show]

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
		@user = User.find(params[:id])
	end

	def update
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
		@user = User.find(params[:id])
		@tdScore = Highscore.where("user_id = ?", @user.id).joins(:game).where('name = "Tower Defense"')[0]
		@psScore = Highscore.where("user_id = ?", @user.id).joins(:game).where('name = "Phaser Stars"')[0]
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
