class CreateHighscores < ActiveRecord::Migration
  def change
    create_table :highscores do |t|
      t.references :game, index: true
      t.references :user, index: true
      t.integer :value
      t.timestamps
    end
  end
end
