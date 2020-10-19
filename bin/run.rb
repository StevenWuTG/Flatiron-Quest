#require 'pry'
require_relative '../config/environment'
require "tty-prompt"
prompt = TTY::Prompt.new

system("clear")

IntroMessage.welcome
puts "\n\n\nA RPG game based on the life of a Flatiron Student!  Remember to read the README!\n\n"
sleep 2

CLI.main_menu

puts "End of Program"

# binding.pry