class PagesController < ApplicationController

	def scoreboard
		@tdScores = Highscore.joins(:game).where('games.name = "Tower Defense"')
		@psScores = Highscore.joins(:game).where('games.name = "Phaser Stars"')
	end

	def towerDefense
		@highscores = Highscore.joins(:game).where('games.name = "Tower Defense"')
	end

	def phaserStars
		@highscores = Highscore.joins(:game).where(games.name = 'Phaser Stars')
	end
end