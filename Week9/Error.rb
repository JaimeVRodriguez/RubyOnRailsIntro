#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

class Screen
    
    def cls
        puts ( "\n" * 25 )
        puts "\a"
    end
    
    def pause
        STDIN .gets
    end
end
    
class Game
    
    def instructions
        #unneeded space after S
        S.cls
        print "***INSTRUCTIONS***"
        print "\n\nThis game tests you ability "
        print "\nto remember sequences of numbers "
        print "\nplease repeat the sequence as it increases"
        print "\n\n\nPress Enter to continue: "
        #unneeded space after S
        S.pause
    end
    
    def get_number
        randomNo = rand( 10 )
        return randomNo
    end
    
    def play_game
        #unneeded spaces before and after "."
        nums = Array.new
    
        loop do
    
            #does not match the defined method. Should be get_number
            number = get_number
    
            nums.append(number.to_i)
    
            print "\n\nRemember these numbers and press enter: "
            print nums.join( " " )
    
            #Should be capital S
            S.pause
            #unneeded space after S
            S.cls
            #unneeded space after S
            S.cls
    
            print "Enter the number(s) then press Enter: "
    
            #unneeded space after STDIN
            guess= STDIN.gets
            guess.chop!
    
            if nums==guess.to_s.split(//).map{|chr| chr.to_i} #Taken from internet to turn string into array
                print "\nCorrect, lets keep playing!"
            else
                #unneeded space after S
                S.cls
                print "\n\n\nIncorrect guess"
                puts "\n\n****Game Over****"
                puts "\nThanks for playing!"
                break
            end
        end
    end
end

#unneeded space befroe and after "."
S = Screen.new
#unneeded space before and after "."
G = Game.new
    
G .instructions
G .play_game