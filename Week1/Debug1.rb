#--------------------------------------------------------------------------
# 
# Script Name: Debug1.rb
# Version:     1.3
# Author:      Jaime V. Rodriguez
# Date:        08 June 2020
# Assignment #: Assignment 1.3
# 
# Description: This Ruby script has purposely inserted "bugs" in order 
#              for fellow students to practice debuggin a program. 
# 
#--------------------------------------------------------------------------

print "Enter your name: "

#miss "D" should read STDIN.gets
name = STIN.gets
name.chop!

message = "Hello " + name + "! Have a great day!"

#missing "s" should read puts
put message