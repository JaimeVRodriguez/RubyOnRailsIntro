#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

# *** Changed Print to print - Needed to be lower case ***
print "Please enter a number 0-9 and press Enter. "

input = STDIN.gets

input.chop

# *** Incorrect REGEX - Was missing trailing /i ***
if input =~ /[1234567890]/i then

# *** Changed put to puts - Was missing s ***
puts "A number has been submitted!"

end