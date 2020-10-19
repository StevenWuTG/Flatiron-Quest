require "tty-prompt"
require "pry"



class CLI
    @@prompt = TTY::Prompt.new
    @@artii = Artii::Base.new :font => 'slant'
    @@user = nil

    def welcome
        system('clear')
        puts @@artii.asciify("Welcome to")
        puts @@artii.asciify("Flatiron Quest!!!")
        self.auth_sequence
    end

    def auth_sequence
        sleep(1.5)
        @@user = User.first
        self.display_menu
            choices = { "Log In" => 1,
                "Create Account" => 2
        }
            choice = @@prompt.select("Would you like to create an account or log in?", choices)
            if choice == 1
                @@user = User.login
                if @@user
                    self.display_menu
                else
                    self.auth_sequence
                end
            else
                @@user = User.signup
                if @@user
                    self.display_menu
                else
                    self.auth_sequence
                end
            end
    end
#binding.pry


end #end of class