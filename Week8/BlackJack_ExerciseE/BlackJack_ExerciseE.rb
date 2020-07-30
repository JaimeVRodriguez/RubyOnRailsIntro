#--------------------------------------------------------------------------
# 
# Script Name: BlackJack_ExerciseE.rb
# Version:     1.1
# Author:      Jaime Rodriguez
# Date:        20 July 2020
# Assignment:  Assignment 8.1
# Updates:     Read instruction and credit files
#              Create method to get external files
#              Create results file after game is complete
#              Delete resutls file if one exists
#              Make files accessible on different operating systems 
# 
# Description: This Ruby game is a computerized version of the casino card
#              game in which the player competes against the dealer (i.e.,
#              computer) in an effort to build a hand that comes as close
#              as possible to 21 without going over.
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

  # *** Number 1 - Create method to read instructions file ***
  # *** Number 1 - Delete previous intrusctions method ***
  # *** Number 2 - Change name to get_file and have an argument ***
  # *** Number 3 - Call global variable based on new argument ***
  def get_file(file)
    Console_Screen.cls

    if file == 'Help'
      puts $help_file
    elsif file == 'Welcome'
      puts $welcome_file
    elsif file == 'Credits'
      puts $credits_file
    end

    Console_Screen.pause
  end

  # *** Number 3 - Create method to retreive files and assign to global variable ***
  # *** Number 5 - Include ability to use on different operating systems ***
  def retrieve_files
    if RUBY_PLATFORM =~ /win32|win64/i then
      $help_file = File.read('C:\files\BJHelp.txt')
      $welcome_file = File.read('C:\files\BJWelcome.txt')
      $credits_file = File.read('C:\files\BJCredits.txt')
    else
      $help_file = File.read('files/BJHelp.txt')
      $welcome_file = File.read('files/BJWelcome.txt')
      $credits_file = File.read('files/BJCredits.txt')
    end
  end

  # *** Number 4 - Method to append a file to log the results of matches ***
  # *** Number 5 - Include ability to use on different operating systems ***
  def write_log_file(message)
    if RUBY_PLATFORM =~ /win32|win64/i then
      outFile = File.new('C:\temp\BJLog.txt', "a")
      outFile.puts message
      outFile.close
    else
      outFile = File.new('tmp/BJLog.txt', "a")
      outFile.puts message
      outFile.close
    end
  end

  # Number 4 - Method to delete existing file if one already exists ***
  # Number 5 - Include ability to use on different operating systems ***
  def remove_log_file
    if RUBY_PLATFORM =~ /win32|win64/i then
      if File.exist?('C:\temp\BJLog.txt') then
        File.delete('C:\temp\BJLog.txt')
      end

    else
      if File.exist?("tmp/BJLog.txt")
        File.delete("tmp/BJLog.txt")
      end
    end
  end
 
  def play_game

    Console_Screen.cls       
    playerHand = get_new_card
    dealerHand = get_new_card
    
    playerHand = complete_player_hand(playerHand, dealerHand)
    
    if playerHand <= 21 then
      dealerHand = play_dealer_hand(dealerHand)
    end

    determine_winner(playerHand, dealerHand)

  end

  def get_new_card
    card = 1 + rand(13)
    return 11 if card == 1 
    return 10 if card >= 10
    return card 
  end

  def complete_player_hand(playerHand, dealerHand)
    loop do  
      
      Console_Screen.cls  
      puts "Player's hand: " + playerHand.to_s + "\n\n"
      puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"
      print "Would you like another card? (Y/N) "
      
      reply = STDIN.gets  
      reply.chop!  

      if reply =~ /y/i then
        playerHand = playerHand + get_new_card
      end

      if reply =~ /n/i then
        break 
      end
      
      if playerHand > 21 then
        break 
      end
     
    end

    return playerHand
    
  end

  def play_dealer_hand(dealerHand)
    
    loop do  
  
      if dealerHand < 17 then
        dealerHand = dealerHand + get_new_card
      else
        break  
      end
      
    end
    
    return dealerHand
    
  end 


  # *** Number 4 - Adjust method to write results to log ***
  def determine_winner(playerHand, dealerHand)
    
    Console_Screen.cls 

    puts "Player's hand: " + playerHand.to_s + "\n\n"
    puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"
    write_log_file("Player's hand: " + playerHand.to_s)
    write_log_file("Dealer's hand: " + dealerHand.to_s)
   
    if playerHand > 21 then  
      puts "You have gone bust!\n\n"
      write_log_file("The Dealer has won!")
      print "Press Enter to continue."    
    else  
      if playerHand == dealerHand then
          puts "Tie!\n\n"
          write_log_file("Tie!")
          print "Press Enter to continue."
        end
      if dealerHand > 21 then
          puts "The Dealer has gone bust!\n\n"
          write_log_file("The Player has won!")
          print "Press Enter to continue."
      else
        if playerHand > dealerHand then
          puts "You have won!\n\n"
          write_log_file("The Player has won!")
          print "Press Enter to continue."
        end
        if playerHand < dealerHand then
          puts "The Dealer has won!\n\n"
          write_log_file("The Dealer has won!")
          print "Press Enter to continue."
        end
      end  
    end

    # Number 4 - Log results to file with 50 dashes ***
    write_log_file("-" * 50)
      
    Console_Screen.pause       #Pause the game
    
  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new 
BJ = Game.new 

# *** Number 3 - Retreive files with created method ***
BJ.retrieve_files

# *** Number 2 - Utilize new get_file method ***
# *** Number 3 - Call file using new argument ***
BJ.get_file('Welcome')

answer = ""  

loop do

  Console_Screen.cls  

  print "Are you ready to play Ruby Blackjack? (y/n): "

  answer = STDIN.gets  
  answer.chop! 

  break if answer =~ /y|n/i 

end 

if answer =~ /n/i  

  Console_Screen.cls  

  puts "Okay, perhaps another time.\n\n"

else  

  # *** Number 2 - Utilize new get_file method ***
  # *** Number 3 - Call file using new argument ***
  BJ.get_file("Help")

  playAgain = ""  

  loop do  
    
    BJ.play_game

    loop do  

      Console_Screen.cls  
      print "Would you like to play another hand? (y/n): "

      playAgain = STDIN.gets  
      playAgain.chop!  
  
      break if playAgain =~ /n|y/i
  
    end
  
    break if playAgain =~ /n/i
  
  end
  
  # *** Number 2 - Utilize new get_file method ***
  # *** Number 3 - Call file using new argument ***
  BJ.get_file("Credits")
  
end
