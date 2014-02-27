class Game < ActiveRecord::Base
  has_many :highscores
end