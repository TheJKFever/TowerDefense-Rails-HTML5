class PagesController < ApplicationController

	def scoreboard
		@tdScores = Highscore.joins(:game).where("games.name = ?", "Tower Defense").order("highscores.value DESC")
		@psScores = Highscore.joins(:game).where("games.name = ?", "Phaser Stars").order("highscores.value DESC")
	end

	def towerDefense
		@highscores = Highscore.joins(:game).where("games.name = ?", "Tower Defense").order("highscores.value DESC")
	end

	def phaserStars
		@highscores = Highscore.joins(:game).where("games.name = ?", "Phaser Stars").order("highscores.value DESC")
	end
end