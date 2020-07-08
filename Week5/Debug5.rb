#--------------------------------------------------------------------------
# 
# Script Name: Debug5.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        8 July 2020
# Assignment:  Assignment 5.2
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------
class  Screen

    def cls
        puts ("\n" * 25) 
        puts "\a" 
    end

    def pause 
        STDIN.gets  
    end
    
end

class Titles

    def questions
        for i in 1..3
            #Missing # Should read #{i}
            print "Enter your number {i} movie title: "
            movie = gets.chomp!
            # Extra < Should read <<
            $movies <<< movie
        end

    end

    def printer
        puts "Your top 3 movies are:"
        $movies.each do |movie|
            puts movie
        end
    end

end

# Main Script Logic -------------------------------------------------------
Console_Screen = Screen.new
MV = Titles.new

$movies = []

puts "\t\t\t *** FAVORITE MOVIE TITLES ***\n\n\n\n\n\n"

print "Press Enter to Continue"

Console_Screen.pause
Console_Screen.cls

MV.questions

# Missing _ Should read Console_Screen
ConsoleScreen.cls

MV.printer



