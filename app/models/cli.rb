require "tty-prompt"
require "pry"
require "colorize"



class CLI
    @@artii = Artii::Base.new :font => 'slant'

 #################### Main MENU ##########################
  

    def self.main_menu#done
        sleep(1.5)
        prompt = TTY::Prompt.new
        choice = prompt.select("Enter your Canvas username and password or create an account.") do |menu|
            menu.choice "Log In"#.light_blue
            menu.choice "Sign Up"#.light_blue
            menu.choice "Exit game"#.red
        end
        if choice == "Log In"
            system("clear")
            CLI.log_in
        elsif choice == "Sign Up"
            system("clear")
            CLI.sign_up
        elsif choice == "Exit game"
            system("clear")
                puts @@artii.asciify("Boooo ! ! !").colorize(:color => :green).bold
                puts "\n\nHope you get back to studying soon!"
                sleep 2
                system("clear")
                exit!
        end
    end#done

    def self.sign_up#done
        
        prompt = TTY::Prompt.new
        puts @@artii.asciify("Sign Up Page").colorize(:color => :green).bold
        username = prompt.ask("Create a Username:")
        password = prompt.mask("Create a Password:")
        user = User.create(user_name: username, user_password: password)
        system("clear")
        puts @@artii.asciify("Congrats!!").colorize(:color => :green).bold
        puts " "
        sleep 1
        puts "You passed the Entrance Exam!"
        sleep 1
        puts " "
        puts 'You have just enrolled in Flatiron Bootcamp!!'
        sleep 3
        @session_user = User.all.find_by(user_name: username, user_password: password)
        system("clear")
        CLI.user_menu
    end

    def self.log_in
        puts @@artii.asciify("Login Portal").colorize(:color => :green).bold
        puts " "
        prompt = TTY::Prompt.new
        username = prompt.ask("Please Enter Your Username:")
        password = prompt.mask("Please Enter Your Password:")
        if User.find_by user_name: username, user_password: password
            @session_user = User.find_by user_name: username, user_password: password
            system("clear")
            CLI.user_menu
        else
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
                system("clear")
                puts @@artii.asciify("Boooo ! ! !").colorize(:color => :green).bold
                puts "\n\nHope you get back to studying soon"
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
    
    end

########################## USER MENUs ########################

    def self.user_menu
        @monster = Monster.first
        system("clear")
        puts @@artii.asciify("User Menu").colorize(:color => :green).bold
        puts " "
        prompt = TTY::Prompt.new
        puts "Welcome to 9AM Lecture, #{@session_user.user_name}!  Good luck on your labs today!"
        puts " "
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Battle Today's Lab",1
            menu.choice "View Stats",2
            menu.choice "Log Out",3
        end
        if choice == 1 #"Battle Today's Lab"
            CLI.battle_menu
            
        elsif choice == 2# "View Stats"
            @session_user.stats_check
            sleep 3
            system('clear')
            CLI.user_menu
        elsif choice == 3 #"Log Out"
            CLI.log_out
        end
    end


    
        
 ####################### Battle Menus ########################


    def self.battle_menu

        Battle.create( user_id: @session_user.id, monster_id:@monster.id )
        @session_user.update(current_quest: @monster.quest.quest_name) 
        system ('clear')
        #--------------------------------------------------------

        puts @@artii.asciify("Battle ! ! !").colorize(:color => :green).bold
        prompt = TTY::Prompt.new
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
            puts "\nThe lab just got harder cuz you slacked off!!!".blink
            sleep 3
            puts "\nMonster's Current Stats:"
            puts @monster.stats_check
            puts " "
            sleep 3
            CLI.battle_menu
        elsif choice == "Curl up in a ball, give up on the lab, cry and drop out of Flatiron"
            system ('clear')
            puts "\nSorry you feel that way, coding isn't for everyone, better luck next time..."
            sleep 3
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
        puts @@artii.asciify("Fight Menu").colorize(:color => :green).bold
        choice = prompt.select('Choose an option') do |menu|
            menu.choice "Attack!!"
            menu.choice "Snack"
            menu.choice "Take a break"
        end
        if choice == "Attack!!"
            system("clear")
            puts @@artii.asciify("Attack ! !").colorize(:color => :red).blink
            loop do     
                puts "This monster is attacking you at full strength!"
                sleep 2
                user.user_health -= monster.mon_attack
                if user.user_health < 0
                    user.user_health = 0
                    break
                end
                puts "\nYour health takes a hit of #{monster.mon_attack} points!"
                sleep 1
                puts "You have #{user.user_health} health points left."
                sleep 2
                puts "\nYou fight back!"
                sleep 2
                monster.mon_health -= user.user_attack
                puts "\nMonster health takes a hit of #{user.user_attack} points!"
                
                
                puts " "
                sleep 2

            break if user.user_health <= 0 || monster.mon_health <= 0
            end
            
            if user.user_health <= 0
                sleep 2
                puts "The lab defeated you this time..."
                puts " "
                sleep 3
                @session_user.update(user_health: 10)
                system('clear')
                CLI.battle_menu

            elsif monster.mon_health <= 0
                if @monster.id == 4
                    
                    CLI.victory_menu
                elsif @monster.id == 7
                    CLI.victory_menu
                else
                    @monster = Monster.find(@monster.id + 1)
                end

                system("clear")
                sleep 2
                puts @@artii.asciify("Success !").colorize(:color => :green).bold
                sleep 1.5
                puts "Congrats, you defeated the monster and conquered the lab."
                sleep 3
                CLI.post_battle
            end

        elsif choice == "Snack"
            system("clear")
            puts @@artii.asciify("Snack Time").colorize(:color => :green).bold
            # puts " "
            # puts " "
            puts "\n\nCan't concentrate, grabbin a snack."
            puts "*munch* *munch* ".blink
            puts " "
            sleep 2
            # user.user_health += 1
            CLI.fight_seq
        elsif choice == "Take a break"
            system("clear")
            puts @@artii.asciify("Break Time").colorize(:color => :green).bold
            # puts " "
            # puts " "
            puts "\n\nI have no clue what I'm reading right now! "
            puts " "
            sleep 2
            puts "Let me take a fiver real quick."
            puts " "
            sleep 3
            user.user_health += 2
            CLI.fight_seq
        end
    end
        
    def self.post_battle
       
        prompt = TTY::Prompt.new
        support = Support.all
        system("clear")
       
        user = @session_user
        
        system("clear")
        sleep 2
        puts @@artii.asciify("Post Battle").colorize(:color => :green).bold
        #puts " "
        puts "\nCongratulations!  Thought you were finished? " 
        sleep 1
        #puts " "
        puts "\nNow you only have 15 hours of homework and studying left to do! "
        sleep 1
        #puts " "
        puts "\nSee you in 8 hours for 9 am discussion question!"
        sleep 5
        system('clear')
        puts @@artii.asciify("After School").colorize(:color => :green).bold
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
            CLI.battle_menu
        elsif choice == "Rewatch Michelle's Lecture"
            michelle = support.find_by support_name: "michelle"
            system("clear")
            sleep 1
            puts @@artii.asciify("* Smile *")
            puts " "
            puts michelle.support_message
            user.user_health += michelle.support_health
            user.user_attack += michelle.support_attack
            sleep 3
            CLI.battle_menu
        elsif choice == "Rest"
            rest = support.find_by support_name: "rest"
            system("clear")
            sleep 1
            puts @@artii.asciify("Z z Z z Z z Z z...").colorize(:color => :green).bold
            puts " "
            puts rest.support_message
            user.user_health += rest.support_health
            user.user_attack += rest.support_attack
            sleep 3
            CLI.battle_menu
        elsif choice == "Ask for help on Slack"
            slack = support.find_by support_name: "slack"
            system("clear")
            sleep 1
            puts @@artii.asciify("Can anyone help me?!?!").colorize(:color => :green).bold
            puts " "
            puts slack.support_message
            user.user_health += slack.support_health
            user.user_attack += slack.support_attack
            sleep 3
            CLI.battle_menu
        elsif choice == "Peek at solution tab"
            solutions = support.find_by support_name: "solutions"
            system("clear")
            sleep 1
            puts @@artii.asciify("Gotta love Github!").colorize(:color => :green).bold
            puts " "
            puts solutions.support_message
            user.user_health += solutions.support_health
            user.user_attack += solutions.support_attack
            sleep 3
            CLI.battle_menu
        elsif choice == "Read the Readmes"
            docs = support.find_by support_name: "docs"
            system("clear")
            sleep 1
            puts @@artii.asciify("Read the README!!!").colorize(:color => :green).bold
            puts " "
            puts docs.support_message
            sleep 3
            user.user_health += docs.support_health
            user.user_attack += docs.support_attack
            system("clear")
            CLI.battle_menu
        end
        system("clear")
        CLI.battle_menu
    end #self.post_battle

    def self.victory_menu
        @session_user.user_health += 10
        @session_user.user_attack += 3
        @session_user.user_level += 1
        system("clear")
        sleep 2
        puts @@artii.asciify("Congrats ! ! !").colorize(:color => :green).blink
        sleep 3
        puts "\n\nYour hard work has paid off!!!"
        puts "\nYou just passed a quest"
        puts "and you feel really good right now!!"
        sleep 5
        puts " "
        if @monster.id == 4
            system("clear")
            puts @@artii.asciify("Halfway There!").colorize(:color => :green).bold
            sleep 3
            @monster = Monster.find(@monster.id + 1)
            CLI.battle_menu 
        elsif @monster.id == 7
            CLI.completed_mod
    
        else
            @monster = Monster.find(@monster.id + 1)
            CLI.battle_menu
        end  

    end #end of victory menu

    def self.completed_mod #completed mod menu
        puts @@artii.asciify("MOD COMPLETED!!").colorize(:color => :green).bold
        puts "\n\nGAME OVER but in a good way! You just passed your first module!".red
        puts "\nHope you see you for the next one!".yellow
        sleep 2
        puts "\nBased on real life experiences...".green
        puts "\nSpecial thanks to @1005instructors for all of your hardwork and support.".cyan
        puts "\nMade by Mary & Steven".magenta
        puts " "
        prompt = TTY::Prompt.new
        choice = prompt.select("Press Enter to leave game") do |menu|
            menu.choice "Exit"
        end
        if choice == "Exit"
            system("clear")
            @session_user = nil
            exit!
        end
        exit!


    end

end #end of class