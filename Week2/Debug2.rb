#--------------------------------------------------------------------------
# 
# Script Name: Debug2.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        15 June 2020
# Assignment #: Assignment 2.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------

class Screen

    def cls 
      puts ("\n" * 25)  
      puts "\a"  
    end
    
    def pause  
      STDIN.gets  
                  
    end
    
end


class Game

    attr_accessor :answer, :question


    def get_guess
        randomNo = 1 + rand(10)
        
        case randomNo
        when 1
            $answer = 1
        when 2
            $answer = 2
        when 3
            $answer = 3
        when 4
            $answer = 4
        when 5
            $answer = 5
        when 6
            $answer = 6
        when 7
            $answer = 7
        when 8
            $answer = 8
        when 9
            $answer = 9
        when 10
            $answer = 10
        end
    end

    #method missing "end"
    def get_answer
        question = "Enter a number from 1 to 10: "
        print question
    

end


Console_Screen = Screen.new
Guess_Game = Game.new

Guess_Game.get_answer

reply = ""

Guess_Game.get_guess

reply = STDIN.gets
reply.chop!

#missing "$" should read $answer
if reply == answer
    
    Console_Screen.cls
    puts "Great guess!"
else

    Console_Screen.cls
    puts "Your guess of " + reply.to_s + " was wrong. The right answer was " + $answer.to_s + "."
end