require "tty-prompt"
require "pry"



class CLI
    @@artii = Artii::Base.new :font => 'slant'

 #################### Main MENU ##########################
    # @@monster = Monster.first

    # # def self.monster
    #     @@monster
    # end

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
        puts @@artii.asciify("Sign Up Page")
        username = prompt.ask("Create a Username:")
        password = prompt.mask("Create a Password:")
        user = User.create(user_name: username, user_password: password)
        system("clear")
        puts 'You have just enrolled in Flatiron bootcamp!  Congratulations!'
        sleep 3
        @session_user = User.all.find_by(user_name: username, user_password: password)
        system("clear")
        CLI.user_menu
    end

    def self.log_in
        puts @@artii.asciify("Login Portal")
        puts " "
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

########################## USER MENUs ########################

    def self.user_menu
        puts @@artii.asciify("User Menu")
        puts " "
        prompt = TTY::Prompt.new
        puts "Welcome to 9AM Lecture, #{@session_user.user_name}!  Good luck on your labs today!"
        puts " "
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Battle Current Lab"
            menu.choice "View Stats"
            menu.choice "Log Out"
        end
        if choice == "Battle Current Lab"
            CLI.battle_menu
            
        elsif choice == "View Stats"
            @session_user.stats_check
            sleep 3
            system('clear')
            CLI.user_menu
        elsif choice == "Log Out"
        
            CLI.log_out
        end
    end

    # def current_monster
    #     @session_monster = Monster.all.first
    #     Monster.shift
    # end

    
        
 ####################### Battle Menus ########################

    def self.battle_menu
        
        prompt = TTY::Prompt.new
        @monster = Monster.first
        #binding.pry
        # monster = @@monster
        system ('clear')
        puts "Todays monster is #{@monster.mon_name}"
        puts " "
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Fight the monster to conquor the lab"
            menu.choice "Slack off"
            menu.choice "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
        end
        if choice == "Fight the monster to conquor the lab"
            sleep 2
            CLI.fight_seq
        elsif choice == "Slack off"
           
            @monster.mon_attack += 1
            puts " "
            puts "The lab just got harder cuz you slacked off!!!"
            sleep 3
            CLI.battle_menu
        elsif choice == "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
            system ('clear')
            puts " "
            puts "Sorry you feel that way, coding isn't for everyone, better luck next time..."
            sleep 3
            # 
            system('clear')
            CLI.log_out
        end
    end

    def self.battle_menu2
        
        prompt = TTY::Prompt.new
        @monster = Monster.find(@monster.id + 1)
        #binding.pry
        # monster = @@monster
        system ('clear')
        puts "The next monster is #{@monster.mon_name}"
        puts " "
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Fight the monster to conquor the lab"
            menu.choice "Slack off"
            menu.choice "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
        end
        if choice == "Fight the monster to conquor the lab"
            sleep 2
            CLI.fight_seq
        elsif choice == "Slack off"
           
            @monster.mon_attack += 1
            puts " "
            puts "The lab just got harder cuz you slacked off!!!"
            sleep 3
            CLI.battle_menu2
        elsif choice == "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
            system ('clear')
            puts " "
            puts "Sorry you feel that way, coding isn't for everyone, better luck next time..."
            sleep 3
            # 
            system('clear')
            CLI.log_out
        end
    end
    
    




    def self.fight_seq
        prompt = TTY::Prompt.new
        user = @session_user 
        monster = @monster
       
        puts user.stats_check
        sleep 2
       
        puts "VS"
        puts " " 
        sleep 2
        puts monster.stats_check
        sleep 2
        # binding.pry
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Attack!!"
            menu.choice "Snack"
            menu.choice ""
        end
        if choice == "Attack!!"

            loop do     
                puts "This monster is attacking you at full strength!"
                puts " "
                user.user_health -= monster.mon_attack
                sleep 2
                puts "Monster health takes a hit of #{user.user_attack} points"
                sleep 2
                monster.mon_health -= user.user_attack

            break if user.user_health <= 0 || monster.mon_health <= 0
            end
            
            if user.user_health <= 0
                sleep 2
                puts "The lab defeated you this time..."
                sleep 3
                CLI.main_menu
            elsif monster.mon_health <= 0
                sleep 2
                puts "Congrats, you defeated the monster and conquered the lab."
                #binding.pry

                # @monster = Monster.find(@monster.id + 1)
                CLI.post_battle
            end
        elsif choice == "Snack"
            puts "Can't concentrate, grabbin a snack."
            sleep 2
            user.user_health += 1
            CLI.fight_seq
        

        elsif choice == "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
            CLI.log_out
        
        end
    end
        

    

    def self.post_battle
        prompt = TTY::Prompt.new
        system("clear")
        #binding.pry
        user = @session_user
        user.user_level += 1
        # @monster = Monster.find(@monster.id + 1)

        system("clear")
        sleep 2
        puts @@artii.asciify("Victory!!!")
        puts "Congratulations!  Thought you were finished?  Now you only have 15 hours of homework and studying left to do!  See you in 8 hours for 9 am discussion question!"
        sleep 5
        system('clear')
        puts @@artii.asciify("After School")
        # choice = prompt.select('Choose an option') do |menu|
        #     menu.choice "Rewatch Caryn's Lecture"
        #     menu.choice "Rewatch Michelle's Lecture"
        #     menu.choice "Rest"
        #     menu.choice "Ask for help on Slack"
        #     menu.choice ""
        #     menu.choice ""
        # end
        # if choice == "Rewatch Caryn's Lecture"
        #     sleep 1
        #     puts cats.support_name
        #     user.user_health += cats.support_health
        #     user.user_attack += cats.support_attack
        # elsif choice == "Sign Up"
        #     system("clear")
            
        # end


        # system("clear")
        # CLI.battle_menu2
    end

    #    @session_user.completed_labs << @session_monster
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

    #     artii "victory"
        
    #     pick up to 3 rewards
    #     self.quest_level += 1
    #     self.battle_level += 1
    #     self.level += 1

    #     Cli.user_menu

    


end #end of class