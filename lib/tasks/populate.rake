namespace :db do
    desc "Deleting everything in database and making new fake data."
    task :populate => :environment do
        require 'populator'
        require 'faker'

        #to run... do "rake db:populate" in your terminal
        
        password = "TowerDefense"

        # delete values in these models
        Rake::Task['db:drop'].invoke
        Rake::Task['db:create'].invoke
        Rake::Task['db:schema:load'].invoke

        @game = Game.new(:name => "Tower Defense")
        @game.save
        @game = Game.new(:name => "Phaser Stars")
        @game.save

        User.populate 200 do |user|
            user.username = Faker::Internet.user_name
            user.encrypted_password = User.new(:password => password).encrypted_password
            Highscore.populate 1 do |highscore|
                highscore.user_id = user.id
                highscore.game_id = 1
                highscore.value = 1000..200000
            end
            Highscore.populate 1 do |highscore|
                highscore.user_id = user.id
                highscore.game_id = 2
                highscore.value = 1000..200000
            end
        end
    end
end