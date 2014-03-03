class PagesController < ApplicationController

	def scoreboard
		@tdScores = Highscore.joins(:game).where("games.name = ?", "Tower Defense").order("highscores.value DESC")
		@psScores = Highscore.joins(:game).where("games.name = ?", "Phaser Stars").order("highscores.value DESC")
	end

	def towerDefense
		@highscores = Highscore.joins(:game).where("games.name = ?", "Tower Defense").order("highscores.value DESC").first(25)
		if @current_user.present?
			@highscore = Highscore.joins(:game).where("games.name = ? AND user_id = ?", "Tower Defense", @current_user.id).first()
		end
	end

	def phaserStars
		@highscores = Highscore.joins(:game).where("games.name = ?", "Phaser Stars").order("highscores.value DESC").first(25)
		if @current_user.present?
			@highscore = Highscore.joins(:game).where("games.name = ? AND user_id = ?", "Phaser Stars", @current_user.id).first()
		end
	end
end