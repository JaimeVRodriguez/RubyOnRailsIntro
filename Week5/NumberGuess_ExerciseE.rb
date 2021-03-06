#--------------------------------------------------------------------------
# 
# Script Name: NumberGuess_ExerciseE.rb
# Version:     1.1
# Author:      Jaime V. Rodriguez
# Date:        July 7, 2020
# Assignment:  Assignment 5.1
# Update Info: Add and display number of games, number of guesses, and average number of guesses
#              Increase range to include number up to 1000
#              Include error message for invalid guesses
#              Limit number of guesses per game to 10
#              Add cheat mode that displays winning number
# 
# Description: This Ruby script is a number guessing game that challenges 
#              the player to guess a randomly generated number in as few 
#              guesses as possible.
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

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
 
  def display_greeting
  
    Console_Screen.cls  
  
    print "\t\t  Welcome to the Ruby Number Guessing Game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
  Console_Screen.pause 

  end
 
  def display_instructions
    
    Console_Screen.cls   
    puts "INSTRUCTIONS:\n\n"  

    # Number 2 - Update instructions to reflect increased range ***
    # Number 4 - Update instructions to reflect maximum number of guesses ***
    puts "This game randomly generates a number from 1 to 1000 and" 
    puts "challenges you to identify it in as few guesses as possible."
    puts "There will be a maximum of 10 guesses allowed, after which you"
    puts "will be asked to play the game or not."
    puts "After each guess, the game will analyze your input and provide"
    puts "you with feedback. You may take as many turns as you need in" 
    puts "order to guess the game's secret number.\n\n\n"
    puts "Good luck!\n\n\n\n\n\n\n\n\n"
    print "Press Enter to continue."

    Console_Screen.pause    
    
  end
 
  def generate_number
  
    # *** Number 2 - Increase range from 100 to 1000 ***
    return randomNo = 1 + rand(1000)
  
  end

  def play_game(mode)

    number = generate_number  

    # *** Number 4 - Allow only 10 guesses for game ***
    while $noOfGuesses < 10
  
      Console_Screen.cls    

      # *** Number 5 - Run play game in cheat mode if cheat option selected ***
      if mode == "c" then
        puts "*** CHEAT MODE ***"
        puts "Winning number is: #{number}\n\n"
      end
    
      print "\nEnter your guess and press the Enter key: "
    
      reply = STDIN.gets 
      reply.chop!         
      reply = reply.to_i 

      # *** Number 1 - Increment game count by 1 ***
      $noOfGuesses += 1
    
      # *** Number 2 - Accept inputs up to 1000 ***
      if reply < 1 or reply > 1000 then
        # *** Number 3 - Error message for invalid inputs ***
        Console_Screen.cls
        puts "*** ERROR ***\n\n"
        puts "You have entered an invalid input. "
        print "Press Enter to continue"
        Console_Screen.pause
  
      end
    
      if reply == number then  
        Console_Screen.cls       
        print "You have guessed the number! Press enter to continue."
        Console_Screen.pause    
        break 
      elsif reply < number then  
        Console_Screen.cls       
        print "Your guess is too low! Press Enter to continue."
        Console_Screen.pause    
      elsif reply > number then  
        Console_Screen.cls       
        print "Your guess is too high! Press Enter to continue."
        Console_Screen.pause  
      end
      
    end

  end

  def display_credits
  
    Console_Screen.cls  
  
    
    puts "\t\tThank you playing the Ruby Number Guessing Game.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

# *** Number 1 - Create variable to track games and guesses ***
$gameCount = 0
$noOfGuesses = 0
$totalNoOfGuesses = 0
$avgNoOfGuesses = 0

Console_Screen = Screen.new 
SQ = Game.new               

SQ.display_greeting

answer = ""

loop do

  Console_Screen.cls

  print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

  answer = STDIN.gets 
  answer.chop! 

  # *** Number 5 - Give secret cheat option ***
  break if answer == "y" || answer == "n"  || answer == "c"#Exit loop

end 

if answer == "n" 

  Console_Screen.cls  

  puts "Okay, perhaps another time.\n\n"

else  

    SQ.display_instructions

  loop do
    
    
    SQ.play_game answer

    Console_Screen.cls  

    
    print "Would you like to play again? (y/n): "

    playAgain = STDIN.gets  
    playAgain.chop! 

    # *** Number 1 - Increment count of games, get total number of guess, and calculate average ***
    $gameCount += 1
    $totalNoOfGuesses += $noOfGuesses
    $avgNoOfGuesses = $totalNoOfGuesses / $gameCount
  
    break if playAgain == "n"  #Exit loop
  
  end

  # *** Number 1 - Display games played and average guesses ***
  Console_Screen.cls
  puts "Games played: #{$gameCount}"
  puts "Avg Guesses: #{$avgNoOfGuesses}"
  print "Press Enter to end game"
  Console_Screen.pause


  SQ.display_credits
  
end


