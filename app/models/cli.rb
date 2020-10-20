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
        @monster = Monster.current_monster
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


    def self.fight_seq
        prompt = TTY::Prompt.new
        user = @session_user 
        # monster = #user.current_monster
        # puts user.stats_check
         
        # puts monster.stats_check
        # sleep 2
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Attack!!"
            menu.choice "Snack"
            menu.choice ""
        end
        if choice == "Attack!!"
            monster.mon_health -= user.attack
            if user.health <= 0
                puts "The lab defeated you this time..."
                sleep 3
                CLI.main_menu
            elsif monster.health <= 0
                puts "Congrats, you defeated the monster and conquered the lab."
                  @@monster = Monster.find(@@monster.id + 1)
                CLI.post_battle
            end
        elsif choice == "Snack"
            puts "Can't concentrate, grabbin a snack."
            user.health += 1
            CLI.fight_seq

        elsif choice == "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
            CLI.log_out
        end
    end
        

    

    # def self.post_battle
    #   user.user_level += 1
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

        #artii "victory"
        
        #pick up to 3 rewards
        #self.quest_level += 1
        #self.battle_level += 1
        #self.level += 1

        #Cli.user_menu

    # end


end #end of class