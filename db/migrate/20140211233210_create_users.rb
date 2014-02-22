class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username
			t.string :encrypted_password
			t.string :avatar_url
			t.string :salt
			t.integer :high_score
			t.timestamps
		end
	end
end
