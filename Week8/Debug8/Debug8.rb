#--------------------------------------------------------------------------
# 
# Script Name: Debug8.rb
# Version:     1.0
# Author:      Jaime V. Rodriguez
# Date:        27 July 2020
# Assignment:  Assignment 8.2
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

class Game

    def intro
        puts "\n\n\t\t\tWelcome To The Picture Game"
        puts "\n\n\t\t\tDepending on your choice you will be shown one of two images."
        puts "\n\n\t\t\tYour surprise awaits"
        print "\n\n\n\n\n\nPress Enter to Continue"
        Console_Screen.pause
    end

    def question
        Console_Screen.cls
        puts "Enter FULL or EMPTY to see your results "
        print "\n\n\n\n Answer: "
    end

    def file(fileName)
        Console_Screen.cls
        # Should read FULL instead of full
        if fileName == 'full'
            puts $fullTree
        elsif fileName == 'EMPTY'
            puts $emptyTree
        end
        Console_Screen.pause
    end
    
    def retreive
        # Incorrect method. Should read .read
        $fullTree = File.Read('files/fullTree.txt')
        $emptyTree = File.Read('files/emptyTree.txt')
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
Tree = Game.new

Tree.retreive

answer = ''

Tree.intro

Tree.question
answer = STDIN.gets
answer.chomp!
answer.upcase!

Tree.file(answer)

Tree.creds
