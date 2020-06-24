#--------------------------------------------------------------------------
# 
# Script Name: TypingChallenge_ExerciseE.rb
# Version:     1.1
# Author:      Jaime V. Rodriguez
# Date:        June 22, 2020
# Assignment:  Assignment 3.1
# Update Info: Add 5 additional challenges
#              Add grades case statement and grade explanation
#              Give feedback for incorrect user input
#              Prevent blank user inputs for challenges
# 
# Description: This Ruby script demonstrates how to apply conditional logic 
#              in order to analyze user input and control script execution 
#              through the development of a computer typing test that
#              evaluates the player's typing skills.
#
#--------------------------------------------------------------------------


class Screen

  def cls  
    puts ("\n" * 25)  
    puts "\a"  
  end

  def minor_cls
    puts("\n" * 6)
    puts "\a"
  end
  
  def pause   
    STDIN.gets  
  end
  
end


class Test
 
  def display_greeting
  
    Console_Screen.cls 
    print "\t\t  Welcome to the Ruby Typing Challenge game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. \n\n: "
  
    Console_Screen.pause     
  end
 
  def display_instructions
    
    Console_Screen.cls       
    puts "\t\t\tInstructions:\n\n" 

    # *** Number 1 - Adjust instructions to tell player there are 5 sentences ***
    # *** Number 2 = Adjust instructions to display grading information ***
    puts %Q{    This test consists of a series of 10 typing challenges. 
    The challenge sentences are presented one at a time. To respond 
    correctly, you must retype each sentence exactly as shown and press 
    the Enter key. Your grade will be displayed at the end of the test.
    \n
    \t\t\tGrading infromation:\n
    \t\t\t*** Amount Correct ***
    \t\t\t\t9-10 = A
    \t\t\t\t8 =    B
    \t\t\t\t7 =    C
    \t\t\t\t6 =    D
    \t\t\t\t0-5 =  F

    \n\n\n\n\n\n\n\n\n
    Press Enter to continue.\n\n}

    Console_Screen.pause       
  end
 
  def present_test(challenge)
    
    Console_Screen.cls       
    print challenge + "\n\n: "  
    result = STDIN.gets  
    result.chop!         

    # *** Number 5 - Prevent blank user input ***
    while result == ""
      puts "You have not entered anything. Try again."
      Console_Screen.minor_cls
      puts "#{challenge}"
      result = STDIN.gets
      result.chop!
    end
    
    if challenge == result then
      $noRight += 1  
      Console_Screen.cls     
      print "Correct!\n\nPress Enter to continue." 
      Console_Screen.pause 
      
    else  
      Console_Screen.cls    
    
      # *** Number 4 - Add comparison to determine error ***
      print "Incorrect!\n\n"
      puts %Q{Original Sentence: #{challenge}}
      puts %Q{Your Sentence:     #{result}\n\n}
      print "Press Enter to continue."
      Console_Screen.pause      
    end
  end

  def determine_grade
  
    Console_Screen.cls   
  
    # *** Number 2 - Add case statement for letter grade ***
    case $noRight
      when 10
        puts "Your grade is an A."
      when 9
        puts "your grade is an A."
      when 8
        puts "Your grade is a B."
      when 7
        puts "Your grade is a C."
      when 6
        puts "Your grade is a D."
      else 
        puts "Your grade is an F."
    end

    # *** Number 1 - Adjust passing score to at least 6 ***
    if $noRight >= 6 then
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "You have passed the typing test!\n\nPress Enter to continue."
      
    else  
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "You have failed the typing test!\n\nPress Enter to continue."
    end
  end
end


# Main Script Logic -------------------------------------------------------


$noRight = 0

Console_Screen = Screen.new  
Typing_Test = Test.new        

Typing_Test.display_greeting

Console_Screen.cls

print "Would you like to test your typing skills? (y/n)\n\n: "

answer = STDIN.gets 
answer.chop! 
  
until answer == "y" || answer == "n"

  Console_Screen.cls  

  print "Would you like to test your typing skills? (y/n)\n\n: "

  answer = STDIN.gets  
  answer.chop!  
end 


if answer == "n" 

  Console_Screen.cls 

  puts "Okay, perhaps another time.\n\n"

else  

  Typing_Test.display_instructions
  
  Typing_Test.present_test "In the end there can be only one."
  Typing_Test.present_test "Once a great plague swept across the land."
  Typing_Test.present_test "Welcome to Ruby Principles of Ruby Programming"
  Typing_Test.present_test "There are very few problems in the world " +
  "that enough M&Ms cannot fix."
  Typing_Test.present_test "Perhaps today is a good day to die. Fight " +
  "beside me and let us die together."


  # *** Number 1 - Add 5 additional typing challenges ***
  Typing_Test.present_test "Any fool can write code that a computer can " + 
  "understand. Good programmers write code that humans can understand."
  Typing_Test.present_test "First solve the problem. Then write the code."
  Typing_Test.present_test "Code is like humor. When you have to explain it, it's bad."
  Typing_Test.present_test "Before software can be reusable it first has to be usable."
  Typing_Test.present_test "Make it work, make it right, make it fast."


  Typing_Test.determine_grade

  Console_Screen.pause    
  
  Console_Screen.cls 
  puts "Thank you for taking the Ruby Typing Challenge.\n\n"
end


