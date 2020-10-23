require "colorize"






class IntroMessage




    @@prompt = TTY::Prompt.new
    @@artii = Artii::Base.new :font => 'slant'


    def self.welcome
        #binding.pry

        


        system('clear')
        puts @@artii.asciify("Welcome").colorize(:color => :green).bold
        sleep 1
        puts @@artii.asciify("To . . .").colorize(:color => :green).bold
        sleep 2
        puts @@artii.asciify("Flatiron Quest ! ! !").colorize(:color => :green).blink
        sleep 1.5
        puts " "
        puts " "
        puts "\n\nA RPG game based on the life of a Flatiron Student!  Remember to read the README!\n\n".light_green.bold

        
    end

end
