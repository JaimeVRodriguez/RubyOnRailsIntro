#--------------------------------------------------------------------------
# 
# Script Name: Debug8.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        03 August 2020
# Assignment:  Assignment 9.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
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

class Calculator

    def intro
        puts "\n\n\t\t\tWelcome To Simple Calculator"
        puts "\n\n\t\t\tYou will be asked to enter two numbers and an opertation"
        puts "\n\n\t\t\tYour question and result will be displayed"
        print "\n\n\n\n\n\nPress Enter to Continue"
        Console_Screen.pause
    end

    def number_question
        Console_Screen.cls
        puts "Enter a number "
        print "\n\n\n\nAnswer: "
    end

    def operation
        Console_Screen.cls
        puts "Enter (+) for addition"
        puts "Enter (-) for subtraction"
        puts "Enter (*) for multiplication"
        puts "Enter (/) for division"
        print "\n\n\n\nAnswer: "
    end

    def math(one, two)
        Console_Screen.cls
        puts "Problem: #{$numOne} #{$operation} #{$numTwo}"
        if $operation == "+"
            $answer = one.to_i + two.to_i
            print "Solution: #{$answer}"
        elsif $operation == "-"
            $answer = one.to_i - two.to_i
            print "Solution: #{$answer}"
        elsif $operation == "*"
            $answer = one.to_i * two.to_i
            print "Solution: #{$answer}"
        elsif $operation == "/"
            #Logic error - should be division operation not multiplication
            $answer = one.to_i * two.to_i
            print "Solution: #{$answer}"
        #Missing he end for the if statement
        
        print "\n\n\n\n\n\nPress Enter to Continue"
        Console_Screen.pause
    end

    def creds
        Console_Screen.cls
        puts "\t\tJaime Rodriguez"
        puts "\n\n\t\tBellevue University"
        Console_Screen.pause
    end
end

# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new
Calc = Calculator.new

$numOne = ''
$numTwo = ''
$operation = ''
$answer = ''

Calc.intro

Calc.number_question
$numOne = STDIN.gets
$numOne.chomp!

Calc.operation
$operation = STDIN.gets
$operation.chomp!

Calc.number_question
$numTwo = STDIN.gets
$numTwo.chomp!

#Should be a "," not the word and
Calc.math($numOne and $numTwo)

Calc.creds
    

