#--------------------------------------------------------------------------
# 
# Script Name: Debug6.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        20 July 2020
# Assignment:  Assignment 7.2
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

    def intro
        puts "\t\t\t*** WELCOME TO THE LUCKY NUMBER GAME ***"

        print "\n\n\n\n\n\n\nPress Enter to continue "
        Console_Screen.pause
    end

    def instructions
        Console_Screen.cls

        puts "You will be provided a lucky number upon pressing enter."
        
        print "\n\n\n\n\n\n\nPress Enter to continue "
        Console_Screen.pause
    end

    def play_game
        number = lucky_num

        displayNumber = display(number)
    end

    def lucky_num
        numbers = [19, 9, 7, 23, 17, 1, 4, 24]
        randomNo = rand(8)

        #number should read numbers to match the array
        return number[randomNo]
    end

    def display(number)
        Console_Screen.cls      
        puts "\n\n\t\t\t====================================="
        puts ""
        #Incorrect to string method should read .to_s
        puts "\n\n\t\t\t\tYour Lucky Number is " + number.to_string
        puts ""
        puts "\n\n\t\t\t====================================="
        puts "\n\n\n\n"
        print "\aPress Enter to continue. "
        Console_Screen.pause
    end

    def credits
        Console_Screen.cls
        puts "\t\t\tJaime Rodriguez"
        puts "\t\t\tBellevue University"
        puts "\t\t\t20 July, 2020"
    end
end


Console_Screen = Screen.new
Lucky = Game.new

answer = ""

Lucky.intro

Console_Screen.cls

loop do

    Console_Screen.cls 
  
    print "Are you ready for your lucky number? (y/n): "
  
    answer = STDIN.gets 
    answer.chop!  
  
    #Incorrect REGEX should read =~
    break if answer == /y|n/i 
  
end 

if answer =~ /n/i  

    Console_Screen.cls  
  
    puts "Okay, perhaps another time.\n\n"
  
  else  
  
    Lucky.instructions
  
    playAgain = ""
  
    loop do  
  
      Lucky.play_game
  
      loop do  
  
        Console_Screen.cls 
  
        print "Would you like to another number? (y/n): "
  
        playAgain = STDIN.gets 
        playAgain.chop!  
  
        break if playAgain =~ /n|y/i
    
      end
  
      break if playAgain =~ /n/i
    
    end
  
    Lucky.credits
    
end

