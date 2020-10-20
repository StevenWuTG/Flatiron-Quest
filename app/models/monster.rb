class Monster < ActiveRecord::Base
    belongs_to :battle
    
    def self.current_monster
        @session_monster = Monster.all.first
        
    end

    def stats_check
        puts "Monster Name: #{self.mon_name}"
        puts "Health: #{self.mon_health}"
        puts "Attack: #{self.mon_attack}"
       
        # sleep 3
        # system('clear')
        # CLI.user_menu
    end

    
end