require 'pry'
require_relative './config/environment'
require "tty-prompt"
prompt = TTY::Prompt.new


cli = CLI.new

cli.welcome

binding.pry