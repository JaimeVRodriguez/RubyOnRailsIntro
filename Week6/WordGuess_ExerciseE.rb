#--------------------------------------------------------------------------
# 
# Script Name: WordGuess_ExerciseE.rb
# Version:     1.1
# Author:      Jerry Lee Ford, Jr.
# Date:        July 15, 2020
# Assignment:  Assignment 6.1
# Update Info: Add additonal words
#              Update Instructions / Hidden instructions menu
#              Provide already used guesses
#              Provide titleized winning word
#             
# Description: This Ruby script demonstrates how to work with regular
#              expressions through the development of a computer game 
#              that challenges the player to guess a mystery word after 
#              being first allowed to guess 5 consonants and 1 vowel.
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
  
    print "\t\t\tWelcome to the Word Guessing Game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
    Console_Screen.pause      
  end
 
  def display_instructions
    
    Console_Screen.cls       
    puts "INSTRUCTIONS:\n\n"  

    #*** Number 2 - Provide better description ***
    puts "The Word Guessing Game is similiar to the hangman game!"
    puts "At the start of each round of play, the game will randomly"
    puts "select one of 40 words that are between five and ten characters"
    puts "long. You will then be given the chance to input six letters"
    puts "(five consonants and one vowel) before making a guess. If any of"
    puts "your letters match the letters in the word, they will be revealed"
    puts "on the screen, thereby making it easier for you to guess the"
    puts "secret word. Otherwise an underscore will represent the missing\n\n"
    puts "Good luck!\n\n\n\n\n\n\n\n\n"
    print "Press Enter to continue."

    Console_Screen.pause     
  end

  def select_word
  
    # *** Number 1 - Double the amount of words (add 20 more) ***
    words = ["W I N D O W", "S T A T I O N", "H A M B U R G E R",
             "E X P R E S S I O N", "W A L L E T", "C A M E R A",
             "A I R P L A N E", "C A N D L E", "C O M P U T E R",
             "P I C T U R E", "F R A M E", "S H E L F", "B O W L I N G",
             "P O L I T E", "S T A T E M E N T", "N E G A T I V E",
             "M E T H O D", "F I S H I N G", "C O M P E N S A T E",
             "H A P P Y", "C A M P I N G", "V E H I C L E", "C O D I N G",
             "R A I L S", "M I C R O S O F T", "A P P L E", "G I T H U B",
             "P Y T H O N", "M E T H O D", "F U N C T I O N", "A R R A Y",
             "R E T U R N", "P R I N T", "C L A S S", "I N P U T",
             "S T R I N G", "B O O L E A N", "I N T E G E R", "L I N E",
             "D O U B L E"]

    # *** Number 1 - Increase number to 39 to allow for new words to be randomly chosen ***
    randomNo = rand(39)
  
    return words[randomNo]  
  end

  def get_consonants
  
    list = Array.new  

    puts "Before you try to guess the secret word, you must specify " +
         "5 consonants.\n\n"
    print "Press Enter to continue."
  
    Console_Screen.pause    
  
    5.times do  
    
      Console_Screen.cls    
    
      
      print "\nPlease enter a consonant and press Enter. "
    
      input = STDIN.gets 
      input.chop!         
      
      if input !~ /[bcdfghjklmnpqrstvwxyz]/i then
        Console_Screen.cls      
        print "Error: " + input + " is not a consonant. Press Enter to " +
        "continue."
        Console_Screen.pause      
        redo  
      end
      
      if input.length > 1 then
        Console_Screen.cls      
        print "Error: You may only enter one character at a time. Press " +
        "Enter to continue."
        Console_Screen.pause      
        redo  
      end

      if list.include?(input.upcase) == true then
        Console_Screen.cls    
        # *** Number 4 - Provide list of already used guesses ***
        print "Error: You have already guessed " + list.inspect.gsub(/"/, "") + ". Press " +
        "Enter to continue."
        Console_Screen.pause      
        redo  
      else
        list.push(input.upcase) 
      end                        
    end
   
    return list  
  end
 
 
  def get_vowel
  
    puts "Before you try to guess the secret word, you must specify " +
    "1 vowel.\n\n"
  
    1.times do 
      
      Console_Screen.cls       

      print "\nPlease enter a vowel and press Enter. "
      input = STDIN.gets 
      input.chop!        

      if input !~ /[aeiou]/i then
        Console_Screen.cls      
        print "Error: " + input + " is not a vowel. Press Enter to " +
        "continue."
        Console_Screen.pause    
        redo  
      end

      if input.length > 1 then
        Console_Screen.cls      
        print "Error: You may only enter one character at a time. Press " +
        "Enter to continue."
        Console_Screen.pause      
        redo 
      end
      
      input = input.upcase  
      return input  
    end
  end
 
  def prompt_for_guess(shortWord, word, consonants, vowel)
  
    Console_Screen.cls     
   
    consonants.push(vowel)  

    wordArray = word.split(" ") 
  
    i = 0 

    wordArray.each do |letter| 
    
      match = false 

      consonants.each do |character|
                
        if character == letter then
          match = true  
          break 
        end
      end

      if match == false then
        wordArray[i] = "_"  
      end                   
  
      i = i + 1 
    end

    word = wordArray.join(" ")

    3.times do |i|  
        
      Console_Screen.cls     

      puts "I am thinking of a word.\n\n\n\n\n\n"
      print "Here is your clue:  " + word + "\n\n\n\n\n\n\n\n"
      print "What do you think this word is?  "
      reply = STDIN.gets  
      reply.chop!        
      reply = reply.upcase  

      if reply == shortWord then 
      
        Console_Screen.cls    
        print "Correct! Press Enter to continue."
        Console_Screen.pause     
        break  
        
      else  
      
        Console_Screen.cls      
 
        if i == 1 then 
          print "Wrong! You have one guess left. Press Enter to " +
          "try again."
        elsif i == 2
          print "Sorry, you lose.\n\n"
          # *** Number 4 - Provide winning word as a titlized word ***
          shortWord = shortWord.downcase
          print "The word was " + shortWord.gsub(/\w+/, &:capitalize) + ". Press Enter to continue."
        else
          print "Wrong! Press Enter to try again."
        end 
        
        Console_Screen.pause     
      end    
    end
  end

  def play_game

    word = select_word  

    Console_Screen.cls       
    
    consonants = get_consonants 

    Console_Screen.cls      

    vowel = get_vowel 

    shortWord = word.gsub(" ", "")

    prompt_for_guess(shortWord, word, consonants, vowel)
      
    Console_Screen.cls  
  end

  def display_credits
  
    Console_Screen.cls  

    puts "\t\t     Thank you for playing the Word Guessing Game.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"
  end
end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  
WordGuess = Game.new        

WordGuess.display_greeting

answer = ""  

loop do

  Console_Screen.cls  

  print "Are you ready to play the Word Guessing Game? (y/n): "

  answer = STDIN.gets  
  answer.chop!  

  # *** Number 3 - Provide hidden option for instruction menu ***
  break if answer =~ /y|n|h/i
end 

if answer == "n" or answer == "N" 

  Console_Screen.cls 

  puts "Okay, perhaps another time.\n\n"

# *** Number 3 - Provide hint by pressing secret h option
elsif answer == "h" or answer == "H"

  WordGuess.display_instructions

  loop do 

    WordGuess.play_game

    print "Enter Q to quit or press any key to play again: "

    playAgain = STDIN.gets 
    playAgain.chop!  

    # *** Number 3 - Allow to secret h option after a round of play                  
    if playAgain =~ /h|H/i

      WordGuess.display_instructions
    end
  
    break if playAgain =~ /Q/i 
  end
  
  WordGuess.display_credits

else 

  loop do  

    WordGuess.play_game

    print "Enter Q to quit or press any key to play again: "

    playAgain = STDIN.gets  
    playAgain.chop!  

    # *** Number 3 - Allow to secret h option after a round of play                  
    if playAgain =~ /h|H/i

      WordGuess.display_instructions
    end

    break if playAgain =~ /Q/i 
  end

  WordGuess.display_credits
end
