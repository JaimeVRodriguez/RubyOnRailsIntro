#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

class Screen

    def cls  
        puts ("\n" * 25)  
        puts "\a" 
    end

    def pause    
        STDIN.gets  
    end
end

# STDIN.gets was missing the letter "s"
begin
puts "Enter a number from 1-10"
number = STDIN.gets
end until number.to_i > 0 && number.to_i < 11

# Case statement was missing "end"
case number.to_i
when 1..2
    puts "Why did the blonde call an exterminator?
    Her computer had a bug..."
when 3..4
    puts "Why do we tell actors to break a leg?
    Because every play has a cast."
when 5..6
    puts "Why don’t scientists trust atoms?
    Because they make up everything"
else
    puts "You didn't get a joke this time. Sorry."
end