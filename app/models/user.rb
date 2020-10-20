require "tty-prompt"

class User < ActiveRecord::Base
    has_many :battles
    has_many :quests, through: :battles
    has_many :monsters, through: :battles
    has_many :supports, through: :battles
    @@prompt = TTY::Prompt.new

    @completed_labs = []


    def self.signup
        username = @@prompt.ask("Please create a username.")
        password = @@prompt.mask("Please create a password.")
        self.create(user_name: username, user_password: password)
    end

    def self.login
        username = @@prompt.ask("Enter your username.")
        password = @@prompt.mask("Enter your password.")
        self.find_by(user_name: username, user_password: password)
    end

    def self.save_quit
        prompt = TTY::Prompt.new
        leave = prompt.select("Do you want to save and quit this challenge?") do |menu|
            menu.choice "Yes"
            menu.choice "No"
        end
        if leave == "Yes"
            system('clear')
            CLI.user_menu
        elsif leave == "No"
            system('clear')
            CLI.user_menu
        end
    end

    def stats_check
        puts "User Name: #{self.user_name}"
        puts "Health: #{self.user_health}"
        puts "Attack: #{self.user_attack}"
        puts "Student Level: #{self.user_level}"
       # sleep 3
        # system('clear')
        # CLI.user_menu

        
    end
    
end