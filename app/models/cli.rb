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
            menu.choice "Exit game"
        end
        if welcome == "Log In"
            system("clear")
            CLI.log_in
        elsif welcome == "Sign Up"
            system("clear")
            CLI.sign_up
        elsif welcome == "Exit game"
            puts "Hope you get back to studying soon"
            sleep 2
            system("clear")
            exit!
                
        end
    end#done

    def self.sign_up#done
        
        prompt = TTY::Prompt.new
        puts @@artii.asciify("Sign Up Page")
        username = prompt.ask("Create a Username:")
        password = prompt.mask("Create a Password:")
        user = User.create(user_name: username, user_password: password)
        system("clear")
        puts @@artii.asciify("Passed Entrance Exam!")
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
            menu.choice "Exit Game"
            end
            if choice == "Retry Log In"
                system("clear")
                CLI.log_in
            elsif choice == "Create Username and Password"
                system("clear")
                CLI.sign_up
            elsif choice == "Exit Game"
            puts "Hope you get back to studying soon"
            sleep 2
            system("clear")
            exit!
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


    {}
        
 ####################### Battle Menus ########################

    def self.battle_menu
        @quest = Quest.first
        Battle.create(user_id: @session_user.id, quest_id: @quest.id)
        
        prompt = TTY::Prompt.new
        @monster = Monster.first
        system ('clear')
        puts @@artii.asciify("Class Time!!")
        sleep 1.5
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
            sleep 2
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
        # @monster = Monster.find(@monster.id + 1)
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
            puts @monster.stats_check
            puts " "
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
        sleep 3
        system('clear')
        puts @@artii.asciify("Attack Menu")
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Attack!!"
            menu.choice "Snack"
        end
        if choice == "Attack!!"
            system("clear")
            puts @@artii.asciify("Attack!!")
            loop do     
                puts "This monster is attacking you at full strength!"
                puts " "
                sleep 2
                user.user_health -= monster.mon_attack
                puts "Your health takes a hit of #{monster.mon_attack} points!"
                puts " "
                sleep 2
                puts "You fight back!"
                puts " "
                sleep 2
                puts "Monster health takes a hit of #{user.user_attack} points!"
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
                @monster = Monster.find(@monster.id + 1)
                system("clear")
                sleep 2
                puts "Congrats, you defeated the monster and conquered the lab."
                sleep 3
                CLI.post_battle
            end
        elsif choice == "Snack"
            system("clear")
            puts @@artii.asciify("Snack Time")
            puts " "
            puts " "
            puts "Can't concentrate, grabbin a snack. *munch* *munch* "
            sleep 2
            user.user_health += 1
            CLI.fight_seq
        end
    end
        
    def self.post_battle
        binding.pry
        prompt = TTY::Prompt.new
        support = Support.all
        system("clear")
       
        user = @session_user
        user.user_level += 1
        system("clear")
        sleep 2
        puts @@artii.asciify("Victory!!!")
        puts " "
        puts "Congratulations!  Thought you were finished? " 
        puts " "
        puts "Now you only have 15 hours of homework and studying left to do! "
        puts " "
        puts "See you in 8 hours for 9 am discussion question!"
        sleep 5
        system('clear')
        puts @@artii.asciify("After School")
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Rewatch Caryn's Lecture"
            menu.choice "Rewatch Michelle's Lecture"
            menu.choice "Rest"
            menu.choice "Ask for help on Slack"
            menu.choice "Peek at solution tab"
            menu.choice "Read the Readmes"
        end
        if choice == "Rewatch Caryn's Lecture"
            caryn = support.find_by support_name: "caryn"
            system("clear")
            sleep 1
            puts @@artii.asciify("Meowwww")
            puts " "
            puts caryn.support_message
            user.user_health += caryn.support_health
            user.user_attack += caryn.support_attack
            sleep 3
            CLI.battle_menu2
        elsif choice == "Rewatch Michelle's Lecture"
            michelle = support.find_by support_name: "michelle"
            system("clear")
            sleep 1
            puts @@artii.asciify("*smile*")
            puts " "
            puts michelle.support_message
            user.user_health += michelle.support_health
            user.user_attack += michelle.support_attack
            sleep 3
            CLI.battle_menu2
        elsif choice == "Rest"
            rest = support.find_by support_name: "rest"
            system("clear")
            sleep 1
            puts @@artii.asciify("Z z Z z Z z Z z...")
            puts " "
            puts rest.support_message
            user.user_health += rest.support_health
            user.user_attack += rest.support_attack
            sleep 3
            CLI.battle_menu2
        elsif choice == "Ask for help on Slack"
            slack = support.find_by support_name: "slack"
            system("clear")
            sleep 1
            puts @@artii.asciify("Can anyone help me?!?!")
            puts " "
            puts slack.support_message
            user.user_health += slack.support_health
            user.user_attack += slack.support_attack
            sleep 3
            CLI.battle_menu2
        elsif choice == "Peek at solution tab"
            solutions = support.find_by support_name: "solutions"
            system("clear")
            sleep 1
            puts @@artii.asciify("Gotta love Github!")
            puts " "
            puts solutions.support_message
            user.user_health += solutions.support_health
            user.user_attack += solutions.support_attack
            sleep 3
            CLI.battle_menu2
        elsif choice == "Read the Readmes"
            docs = support.find_by support_name: "docs"
            system("clear")
            sleep 1
            puts @@artii.asciify("Read the README!!!")
            puts " "
            puts docs.support_message
            user.user_health += docs.support_health
            user.user_attack += docs.support_attack
            sleep 3
            CLI.battle_menu2   
        end
        system("clear")
        CLI.battle_menu2

    end #self.post_battle

end #end of class