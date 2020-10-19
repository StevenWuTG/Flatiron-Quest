require "tty-prompt"
require "pry"



class CLI


    def self.main_menu
        sleep(1.5)
        prompt = TTY::Prompt.new
        welcome = prompt.select("Enter your log in credentials or create an account") do |menu|
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
    end

    def self.sign_up
        prompt = TTY::Prompt.new
        username = prompt.ask("Create a Username")
        password = prompt.mask("Create a Password")
        user = User.create(user_name: username, user_password: password)
        puts 'You have just enrolled in Flatiron bootcamp!  Congratulations!'
        sleep 1.5
        @session_user = User.all.find_by(user_name: username, user_password: password)
        system("clear")
        # CLI.user_menu
    end

    # def self.log_in
    #     prompt = TTY::Prompt.new
    #     username = prompt.ask("Enter Your Username")
    #     password = prompt.mask("Enter Your Password")
    #     if User.find_by username: username, password: password
    #         #if username/ password match match
    #         @session_user = User.find_by username: username, password: password
    #         system("clear")
    #         EscapeTheRoom.user_menu
    #     else
    #         #if username/ password don't match
    #         system("clear")
    #         choice = prompt.select('Username/Password not found.') do |menu|
    #         menu.choice "Retry Log In"
    #         menu.choice "Sign Up"
    #         end
    #         if choice == "Retry Log In"
    #             system("clear")
    #             EscapeTheRoom.log_in
    #         elsif choice == "Sign Up"
    #             system("clear")
    #             EscapeTheRoom.sign_up
    #         end
    #     end
    # end

    # def self.log_out
    #     @session_user = nil
    #     system("clear")
    #     EscapeTheRoom.main_menu
    # end

#        

end #end of class