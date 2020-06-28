#--------------------------------------------------------------------------
# 
# Script Name: SupermanQuiz_ExerciseE.rb
# Version:     1.1
# Author:      Jaime V. Rodriguez
# Date:        June 27, 2020
# Assignment:  Assignment 4.1
# Update Info: Add 5 additional questions
#              Provide option to retake quiz
#              Provide credits if no retake
#              Provide helpful URL
#              Provide option to view grading scale
# 
# Description: This Ruby script demonstrates how to work with loops when 
#              collecting user input through the creation of an 
#              interactive quiz that evaluates the player�s knowledge of
#              the Superman movie series.
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


class Quiz
 
  def display_greeting
  
    Console_Screen.cls  
    print "\t\t  Welcome to the Superman Movie Trivia Quiz!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
  Console_Screen.pause       
  end
 
  def display_instructions
    
    Console_Screen.cls       
    puts "INSTRUCTIONS:\n\n"  

    puts "You will be presented with a series of multiple-choice" 
    puts "questions. To answer a question, type in the letter of"
    puts "the corresponding answer and press the Enter key. Your"
    puts "grade will be displayed at the end of the test.\n\n\n"
    puts "Good luck!\n\n"

    # *** Number 5 - Prompt option for grading scale ***
    print "*** For grading information type 'info' and press Enter otherwise just press Enter ***\n\n\n\n\n\n\n\n\n"
    print ": "

    info = STDIN.gets
    info.chop!
    info.downcase!

    if info == "info" 
      disp_scale
    end
  end

  # *** Number 5 - Method to display grading information ***
  def disp_scale
    Console_Screen.cls
    puts "GRADING INFORMATION:\n\n"
    puts "Passing score is 6 or more correct answers"
    puts "If you receive a failing score (5 or less),"
    puts "you will have the choice to try the quiz again.\n\n\n\n\n\n\n\n\n"

    print "Press Enter to begin the quiz."

    Console_Screen.pause
  end
 
  def disp_q(question, q_A, q_B, q_C, q_D, answer)

    loop do
  
      Console_Screen.cls      

      puts question + "\n\n"
      puts q_A
      puts q_B
      puts q_C
      puts q_D
      print "\nType the letter representing your answer: "
    
      reply = STDIN.gets  
      reply.chop!        
    
      
      if answer == reply then
        $noRight += 1  
      end
      
      if reply == "a" or reply == "b" or reply == "c" or reply == "d" then
    
        break  
    
      end
    end
  end

  
  def determine_grade
  
    Console_Screen.cls  
    
    # *** Number 1 -  Adjust to require 6 correct answer to pass ***
    if $noRight >= 6 then
    
      print "You correctly answered " + $noRight.to_s + " question(s). "
      puts "You have passed the \nSuperman Movie Trivia Quiz!\n\n"
      puts "You have earned a rank of: Good Citizen" if $noRight == 3
      puts "You have earned a rank of: Side Kick" if $noRight == 4
      puts "You have earned a rank of: Superhero" if $noRight == 5
      print "\n\nPress Enter to continue."
      
    else  
      # *** Number 4 - Provide URL after failing quiz ***
      print "You missed " + (5 - $noRight).to_s + " questions. "
      puts "You have failed the Superman Movie Trivia Quiz."
      puts "Perhaps you should watch the movies again before returning to"
      puts "retake the quiz."
      puts "Or you can go to http://en.wikipedia.org/wiki/Superman_movies for more information."
      print "\n\nPress Enter to continue."
    end
    
    Console_Screen.pause       
  end

  def display_credits
  
    Console_Screen.cls  
 
    puts "\t\tThank you for taking the SUPERMAN MOVIE TRIVIA QUIZ.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"
  end
end


# Main Script Logic -------------------------------------------------------

$noRight = 0

Console_Screen = Screen.new  
SQ = Quiz.new     

SQ.display_greeting

answer = ""


loop do

  Console_Screen.cls  

  print "Are you ready to take the quiz? (y/n): "

  answer = STDIN.gets  
  answer.chop!  

  break if answer == "y" || answer == "n" 
end 


if answer == "n"  

  Console_Screen.cls  

  puts "Okay, perhaps another time.\n\n"

else  

  SQ.display_instructions
  
  SQ.disp_q("What is the name of the Daily Planet's ace photographer?",
  "a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane", 
  "a")
  
  SQ.disp_q("What is the name of Clark Kent's home town?",
  "a. Metropolis", "b. Gotham City", "c. Smallville", "d. New York", 
  "c")
  
  SQ.disp_q("In which movie did Superman battle General Zod?",
  "a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", 
  "b")
  
  SQ.disp_q("What is the name of Superman's father?",
  "a. Nimo", "b. Jarrell", "c. Lex Luthor", "d. Krypton", 
  "b")

  SQ.disp_q("Where had Superman been at the start of 'Superman Returns'?",
  "a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton", 
  "d")

  # *** Number 1 -  Add 5 additional questions ***
  #sixth question
  SQ.disp_q("What is Supermans middle name?",
  "a. Jimmy", "b. John", "c. Joseph", "d. Lane", 
  "c")
  
  #seventh question
  SQ.disp_q("What is the name Supermans secret headquarters?",
  "a. Krypton Kryp", "b. Fortress of Man", "c. The Fortress", "d. Fortress of Solitude", 
  "d")
  
  #eigth question
  SQ.disp_q("Who did Superman give Kryptonite to use if he ever got out of control?",
  "a. Spiderman", "b. Thor", "c. Wolverine", "d. Batman", 
  "d")
  
  #ninth question
  SQ.disp_q("What is Supermans original name on Krypton?",
  "a. Clark", "b. Kal-El", "c. Luthor", "d. AA", 
  "b")
  
  #tenth question
  SQ.disp_q("How much does Superman weigh?",
  "a. 220 lbs", "b. 250 lbs", "c. 234 lbs", "d. 225 lbs", 
  "d")
  
  SQ.determine_grade

  # *** Number 2 - Give option to retake quiz if they fail ***
  if $noRight <= 5

    loop do

      Console_Screen.cls

      print "Would you like to try the quiz one more time? (y/n): "

      answer = STDIN.gets  
      answer.chop! 

      break if answer == "y" || answer == "n" 
    end

    if answer == 'n'
      SQ.display_credits
    
    else

      SQ.disp_q("What is the name of the Daily Planet's ace photographer?",
        "a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane", 
        "a")
     
        SQ.disp_q("What is the name of Clark Kent's home town?",
        "a. Metropolis", "b. Gotham City", "c. Smallville", "d. New York", 
        "c")
   
        SQ.disp_q("In which movie did Superman battle General Zod?",
        "a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", 
        "b")
       
        SQ.disp_q("What is the name of Superman's father?",
        "a. Nimo", "b. Jarrell", "c. Lex Luthor", "d. Krypton", 
        "b")
 
        SQ.disp_q("Where had Superman been at the start of 'Superman Returns'?",
        "a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton", 
        "d")
      
        SQ.disp_q("What is Supermans middle name?",
        "a. Jimmy", "b. John", "c. Joseph", "d. Lane", 
        "c")
        
        SQ.disp_q("What is the name Supermans secret headquarters?",
        "a. Krypton Kryp", "b. Fortress of Man", "c. The Fortress", "d. Fortress of Solitude", 
        "d")
        
        SQ.disp_q("Who did Superman give Kryptonite to use if he ever got out of control?",
        "a. Spiderman", "b. Thor", "c. Wolverine", "d. Batman", 
        "d")
        
        SQ.disp_q("What is Supermans original name on Krypton?",
        "a. Clark", "b. Kal-El", "c. Luthor", "d. AA", 
        "b")

        SQ.disp_q("How much does Superman weigh?",
        "a. 220 lbs", "b. 250 lbs", "c. 234 lbs", "d. 225 lbs", 
        "d")
        
        SQ.determine_grade
    end
  end
  
  # *** Number 3 - Display credits if user does not retake test ***
  SQ.display_credits
end


