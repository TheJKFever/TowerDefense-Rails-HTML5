class HighscoresController < ApplicationController
	def create
		@highscore = Highscore.new(highscore_params)
		@highscore.save
		respond_to do |f|
			f.json { render json: @highscore }
		end
	end

	def update
		@highscore = Highscore.find(highscore_params[:id])
		@highscore.update_attributes(highscore_params)
		respond_to do |f|
			f.json { render json: @highscore }
		end
	end

	private
	def highscore_params
		params.require(:highscore).permit(:id, :value, :game_id, :user_id)
	end
end
