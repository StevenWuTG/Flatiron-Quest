class IntroMessage
 @@prompt = TTY::Prompt.new
 @@artii = Artii::Base.new :font => 'slant'

 def self.welcome
     system('clear')
     puts @@artii.asciify("Welcome")
     sleep 1
     puts @@artii.asciify("To")
     sleep 1
     puts @@artii.asciify("Flatiron Quest!!!")
     
     
 end
end
