class Monster < ActiveRecord::Base
    belongs_to :battle
    
    def self.current_monster
        @session_monster = Monster.all.first
        
    end

    # def stats_check
    #     puts "User Name: #{self.user_name}"
    #     puts "Health: #{self.user_health}"
    #     puts "Attack: #{self.user_attack}"
    #     puts "Student Level: #{self.user_level}"
       
    #     sleep 3
    #     system('clear')
    #     CLI.user_menu
    # end

    
end