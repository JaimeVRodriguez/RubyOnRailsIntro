#--------------------------------------------------------------------------
# 
# Solution to debug post from a classmate
#
#--------------------------------------------------------------------------

$i = 0
$num = 5
begin

    puts "Inside the loop i = #{$i}"
    #changed from $num to $i to fix infinite loop
    $i +=1
    
end while $i < $num