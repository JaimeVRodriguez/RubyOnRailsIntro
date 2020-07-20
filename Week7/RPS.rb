#--------------------------------------------------------------------------
# 
# Script Name: RPS_ExerciseE.rb
# Version:     1.1
# Author:      Jaime Rodriguez
# Date:        March 2010
# Assignment:  Assignment 7.1
# Update Info: Allow single letter shorthand input
#              Count number of games played
#              Count wins, loses, ties
#              Provide descriptive game result
#              Include alert beep
# 
# Description: This Ruby game s a computerized version of the classic 
#              children�s Rock, Paper, Scissors game, in which the player goes 
#              head-to-head against the computer.
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
  
    print "\t\t\tLet's Play Rock, Paper, Scissors!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. "
  
    Console_Screen.pause       

  end

  def display_instructions
    
    Console_Screen.cls     
    puts "INSTRUCTIONS:\n\n"  

    puts "This game pits the player against the computer. To play, you must"
    puts "enter one of the following moves when prompted: Rock, Paper, or"
    puts "Scissors.\n\n"
    puts "The game will randomly select a move for the computer, and "
    puts "the two moves will then be analyzed according to the following"
    puts "rules: \n\n"
    puts "* Rock crushes Scissors, Rock equals Rock, and Rock is covered by"
    puts "  Paper.\n\n"
    puts "* Paper covers Rock, Paper equals Paper, and Paper is cut by"
    puts "  Scissors.\n\n"
    puts "* Scissors cut Paper, Scissors equals Scissors, and Scissors are"
    puts "  crushed by Rock.\n\n\n"
    puts "Good luck!\n\n\n"
    print "Press Enter to continue. "
    Console_Screen.pause      
    
  end

  def play_game

    Console_Screen.cls   

    playerMove = get_player_move

    computerMove = get_computer_move
       
    result = analyze_results(playerMove, computerMove)

    # Number 2 - Add game count method to play_game ***
    gameCount = game_count

    display_results(playerMove, computerMove, result)
    
  end

  def get_player_move

    Console_Screen.cls      

    loop do  

      Console_Screen.cls 

      # *** Number 5 - Call an alert beep ***
      puts "\aTo make a move, type one of the following and press Enter:\n\n"
      print "[Rock] [Paper] [Scissors]: "

      @choice = STDIN.gets 
      @choice.chop!  

      # *** Number 1 - Allow user to use shorthand version ***
      break if @choice  =~ /Rock|Paper|Scissors|r|R|p|P|s|S/i 

    end 

    return @choice.upcase

  end

  def get_computer_move

    moves = ["ROCK", "PAPER", "SCISSORS"]
 
    randomNo = rand(3)

    return moves[randomNo]  
    
  end
  
  def analyze_results(player, computer)

    # *** Number 1 - Reads shorthand input ***
    # *** Number 3 - Adjust logic to increment results ***
    # *** Number 4 - Provide descriptive win ***
    if player =~ /ROCK|R/i then
      if computer == "SCISSORS"
        $wins += 1
        return "Rock crushes scissors! Player wins!"
      elsif computer == "ROCK"
        $ties += 1
        return "Nothing happens! Tie!"
      else
        $lost += 1
        return "Paper covers rock! Computer Wins!"
      end 
    end

    # *** Number 1 - Reads shorthand input ***
    # *** Number 3 - Adjust logic to increment results ***
    # *** Number 4 - Provide descriptive win ***
    if player =~ /PAPER|P/i then
      if computer == "ROCK"
        $wins += 1
        return "Paper covers rock! Player wins!" 
      elsif computer == "PAPER"
        $ties += 1
        return "Nothing happens! Tie!"
      else
        $lost += 1   
        return "Scissors cut paper! Computer wins!"
      end
    end
  
    # *** Number 1 - Reads shorthand input ***
    # *** Number 3 - Adjust logic to increment results ***
    # *** Number 4 - Provide descriptive win ***
    if player =~ /SCISSORS|S/i then
      if computer == "PAPER"
        $wins += 1
        return "Scissors cut paper! Player wins!" 
      elsif computer == "SCISSORS"
        $ties += 1
        return "Nothing happens! Tie!"
      else
        $lost += 1
        return "Rock crushes scissors! Computer wins!"
      end
    end
  end

  def display_results(player, computer, result)
  
    # Number 2 - Add number of games to results ***
    # Number 3 - Display number of wins, losses, ties ***
    # Number 5 - Call an alert beep ***
    Console_Screen.cls      
    puts "\n\n\t\t\tRESULTS:"
    puts "\n\n\t\t\t================================"
    puts "\n\n\t\t\tPlayer's move:    " + player
    puts "\n\n\t\t\tComputer's move:  " + computer
    puts "\n\n\t\t\tResult:           " + result
    puts "\n\n\t\t\tGames :           " + $gameCount.to_s
    puts "\n\n\t\t\tWins :            " + $wins.to_s
    puts "\n\n\t\t\tLost :            " + $lost.to_s
    puts "\n\n\t\t\tTies :            " + $ties.to_s
    puts "\n\n\t\t\t================================"
    puts "\n\n\n\n"
    print "\aPress Enter to continue. "
    Console_Screen.pause       #Pause the game
  
  end

  # Number 2 - Create a method to increment game count ***
  def game_count
    $gameCount += 1
  end

  def display_credits
  
    Console_Screen.cls  

    puts "\t     Thank you for playing the Rock, Paper, Scissors game.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

# Number 2 - Create a variable to track the number of games ***
$gameCount = 0

# Number 3 - Add game result variable ***
$wins = 0
$lost = 0
$ties = 0

Console_Screen = Screen.new  
RPS = Game.new                   

RPS.display_greeting

answer = ""  

loop do

  Console_Screen.cls 

  print "Are you ready to play Rock, Paper, Scissors? (y/n): "

  answer = STDIN.gets 
  answer.chop!  

  break if answer =~ /y|n/i 

end 

if answer =~ /n/i  

  Console_Screen.cls  

  puts "Okay, perhaps another time.\n\n"

else  

  RPS.display_instructions

  playAgain = ""

  loop do  

    RPS.play_game

    loop do  

      Console_Screen.cls 

      print "Would you like to play again? (y/n): "

      playAgain = STDIN.gets 
      playAgain.chop!  

      break if playAgain =~ /n|y/i
  
    end

    break if playAgain =~ /n/i
  
  end

  RPS.display_credits
  
end
