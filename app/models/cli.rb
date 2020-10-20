require "tty-prompt"
require "pry"



class CLI

    ##MAIN MENU

    def self.main_menu#done
        sleep(1.5)
        prompt = TTY::Prompt.new
        welcome = prompt.select("Enter your username and password or create an account.") do |menu|
            menu.choice "Log In"
            menu.choice "Sign Up"
        end
        if welcome == "Log In"
            system("clear")
            CLI.log_in
        elsif welcome == "Sign Up"
            system("clear")
            CLI.sign_up
        end
    end#done

    def self.sign_up#done
        prompt = TTY::Prompt.new
        username = prompt.ask("Create a Username:")
        password = prompt.mask("Create a Password:")
        user = User.create(user_name: username, user_password: password)
        puts 'You have just enrolled in Flatiron bootcamp!  Congratulations!'
        sleep 3
        @session_user = User.all.find_by(user_name: username, user_password: password)
        system("clear")
        CLI.user_menu
    end

    def self.log_in
        prompt = TTY::Prompt.new
        username = prompt.ask("Please Enter Your Username:")
        password = prompt.mask("Please Enter Your Password:")
        if User.find_by user_name: username, user_password: password
            #if username/ password match match
            @session_user = User.find_by user_name: username, user_password: password
            system("clear")
            CLI.user_menu
        else
            #if username/ password don't match
            system("clear")
            choice = prompt.select('Incorrect username and/or password!') do |menu|
            menu.choice "Retry Log In"
            menu.choice "Create Username and Password"
            end
            if choice == "Retry Log In"
                system("clear")
                CLI.log_in
            elsif choice == "Create Username and Password"
                system("clear")
                CLI.sign_up
            end
        end
    end

    def self.log_out
        @session_user = nil
        system("clear")
        CLI.main_menu
        #db.seeds << self  SAVE USER STATS
    end

    def self.user_menu
        prompt = TTY::Prompt.new
        puts "Welcome to 9AM Lecture, #{@session_user.user_name}!  Good luck on your labs today!"
        puts " "
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Battle Current Lab"
            menu.choice "View Stats"
            menu.choice "Log Out"
        end
        if choice == "Battle Current Lab"
            @session_user.battle_menu
            
        elsif choice == "View Stats"
            @session_user.stats_check
        elsif choice == "Log Out"
            CLI.log_out
        end
    end

    # def self.battle_menu
    #     # prompt = TTY::Prompt.new
    #     # Puts "Todays monster is #{self.current_battle.monster}"
    #     choice 1 = fight lab
    #         monster.health -= user.attack
    #         10 -2 = 8
    #         user.health -= monster.attack

    #     choice 2 = slack off
    #         user.health + 2
    #         user.health -= monster.attack
    #     choice 3 = curl up, give up, cry, and drop out
    #         user.delete
            
    #         CLI.post_battle

    # end

    # def self.post_battle
    #     puts "sweet 6pm is here , you survived today"
    #     choice 1 = do homework
    #         user.health -= 1
    #         user.attack += 2

    #     choice 2 = eat dinner
    #         user.health += 5

    #     choice 3 = slack

    #     choice 4 rewatch Lecture
    #         puts "rewatching the caryns lecture really helped"
    #         user.health 
    #         user.attack += caryn.health_bous

        #artii "victory"
        
        #pick up to 3 rewards
        #self.quest_level += 1
        #self.battle_level += 1
        #self.level += 1

        #Cli.user_menu

    # end


end #end of class