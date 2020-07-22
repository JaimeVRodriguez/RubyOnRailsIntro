#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

class App

    def incease_app_count
        $appIncrease += 1
    end
end

app = App.new

#Was not global. Was missing "$"
$appIncrease = 0

answer = ""

loop do
    puts "Would you like to add a new app?"
    answer = STDIN.gets
    answer.chop!

    #Missing the "answer" variable
    break if answer =~ /y|n/i
end

if answer == 'n'
    puts "Ok, maybe another time."
else
    app.incease_app_count
    puts "You now have #{$appIncrease} app."
end