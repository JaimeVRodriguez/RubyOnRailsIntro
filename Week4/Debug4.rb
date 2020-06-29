#--------------------------------------------------------------------------
# 
# Script Name: Debug4.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        29 June 2020
# Assignment:  Assignment 4.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------

class Count


    def questions
        print "Enter a number between 1 and 10: "
        num1 = gets.chomp.to_i

        while $num1 < 1 || $num1 > 10
            puts "\n\n*** ERROR ***\n"
            puts "Your number was not between 1 and 10."
            print "Enter a number between 1 and 10: "
            $num1 = gets.chomp.to_i
        end
    
        print "Enter any number larger than your first number: "
        $num2 = gets.chomp.to_i

        while $num1 > $num2
            puts "\n\n*** ERROR ***\n"
            puts "Your second number was smaller than your first number."
            print "Enter any number larger than your first number: "
            $num2 = gets.chomp.to_i
        end
    end

    def result
        for i in $num1..$num2
            $total += i
        end
    end

    def final_message
        message = "The total of all numbers between #{$num1.to_s} and #{$num2.to_s} is #{$total.to_s}."
        print message
    end

end

# Main Script Logic -------------------------------------------------------

$num1 = 0
$num2 = 0
$total = 0

#COUNT should read Count as class is defined
CT = COUNT.new

#question should read questions as method is defined
CT.question

CT.result

CT.final_message









