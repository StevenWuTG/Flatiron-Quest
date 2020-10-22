#require 'pry'
require_relative '../config/environment'
require "tty-prompt"
require "colorize"
prompt = TTY::Prompt.new

system("clear")

IntroMessage.welcome


sleep 1.5


CLI.main_menu

puts "End of Program"

# binding.pry

