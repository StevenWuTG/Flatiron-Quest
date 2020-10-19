require "tty-prompt"

class User < ActiveRecord::Base
    has_many :battles
    has_many :quests, through: :battles
    has_many :monsters, through: :battles
    has_many :supports, through: :battles
    @@prompt = TTY::Prompt.new

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

end