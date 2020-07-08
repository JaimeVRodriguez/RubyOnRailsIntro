#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

class Screen

    def cls  #Define a method that clears the display area
      puts ("\n" * 25)  #Scroll the screen 25 times
      puts "\a"  #Make a little noise to get the player's attention
    end
    
    def pause    #Define a method that pauses the display area
      STDIN.gets  #Execute the STDIN class's gets method to pause script
                  #execution until the player presses the enter key
    end
    
end

class Number

    def world
        puts "Hello there. (Press enter)"
        Console_Screen.pause
    end

    def increase
        Console_Screen.cls

        loop do
            # Made "increaseNumber" global
            if $increaseNumber == 10
                puts "Can't increase, reached max."
                break
            else
                # Made "increaseNumber" global
                $increaseNumber += 1
                break
            end
        end
    end

end

Console_Screen = Screen.new
SQ = Number.new

# Made "increaseNumber" global
$increaseNumber = 0

answer = ""

puts "Would you like to play?"
answer = STDIN.gets
answer.chop!

if answer == 'n'
    Console_Screen.cls
    puts "Thanks for playing."
    Console_Screen.pause
else
    SQ.world
    loop do
        SQ.increase
        puts "Would you like to add to the number? The current number is: #{$increaseNumber}"
        choice = STDIN.gets
        choice.chop!
        
        break if choice == 'n'
    end
    Console_Screen.cls
    puts "The final number was: #{$increaseNumber}"
    Console_Screen.pause
end
