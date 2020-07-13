#--------------------------------------------------------------------------
# 
# Script Name: Debug6.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        13 July 2020
# Assignment:  Assignment 6.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------


# Missing blank answer variable decleration  

loop do
  
    puts "Do you own a dog?"
    puts "A) Yes\nB) No\n\n\n"
    print "Answer: "

  
    answer = STDIN.gets  
    answer.chop!  
  
    # Incorrect systax, regex should read /a|b/i
    break if answer =~ /a or b/i
end 
  
if answer == "b" or answer == "B" 

    puts "\n\n\nYou should get a dog!"

else 

    puts "\n\n\nWhat breed is your dog?"
    print "Answer: "
  
    breed = STDIN.gets  
    breed.chop!  

    puts "\n\n\nWhat is your dogs name?"
    print "Answer: "

    name = STDIN.gets
    name.chop!
  
    print "\n\n\nYour #{breed}, #{name}, sounds like an awesome dog!"
end