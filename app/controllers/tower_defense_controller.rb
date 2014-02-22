class TowerDefenseController < ApplicationController
	before_filter :authenticate_user

	def gamepage
		@highscore_users = User.where.not("high_score = 0").select("username, high_score").order("high_score DESC").first(10)
	end

	def scoreboard
		@users = User.all.order("high_score DESC").select("username, high_score") 
	end
end
