#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

print "What's your favorite Color? "

answer=STDIN.gets

answer.chop!

#changed file destination
outFile= File.new("Favorite.txt", "w") 

#gap after . must not exists
outFile.print answer 

#replace end with close
outFile.close