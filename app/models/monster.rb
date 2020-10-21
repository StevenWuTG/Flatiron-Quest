class Monster < ActiveRecord::Base
    has_many :battles
    has_many :users, through: :battles
    has_many :quests, through: :battles
    
    def self.current_monster
        @session_monster = Monster.all.first
        
    end

    def stats_check
        puts "Monster Name: #{self.mon_name}"
        puts "Health: #{self.mon_health}"
        puts "Attack: #{self.mon_attack}"
       
    end

    
end