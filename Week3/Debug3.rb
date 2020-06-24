#--------------------------------------------------------------------------
# 
# Script Name: Debug3.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        22 June 2020
# Assignment #: Assignment 3.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------

class Screen
    def cls
        puts ("\n" * 6)
    end
end 

Console_Screen = Screen.new




print "Enter one of the following numbers. 1 - 2 - 3: "

answer = gets.chomp!
# Incorrect method should read .to_i
answer = answer.toi

# || should be changed to &&
while answer != 1 || answer != 2 && answer != 3
    Console_Screen.cls
    puts "You did not enter 1, 2, or 3."
    print "Enter your new answer: "
    answer = gets.chomp!
    answer = answer.to_i
end 

Console_Screen.cls

# answe spelled incorrectly. Should read answer
case answe
    when 1
        print "Number #{answer}. Great choice!"
    when 2
        print "Number #{answer}. That's an okay choice."
    when 3
        print "Number #{answer}. Bad choice..."
end
