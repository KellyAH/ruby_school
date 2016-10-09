# Name: Kelly Hong
# Date: 2016-09-07 Wed
# File: lab1.cgi
# Desc:  use String class methods to manipulate and print the_string
# Assigment: #https://ccsf.instructure.com/courses/2612/assignments/21424?module_item_id=84280
# ex output: http://hills.ccsf.edu/~kfreedma/cs132a/lab1.cgi

# get required libraries
# library to do network requests
require "open-uri"

# get sample string from URL
# create empty string to store the concatinated string into
the_string = String.new("")
the_url = "http://hills.ccsf.edu/~kfreedma/cs132a/the_string.cgi"


# Concatenate all of the lines into the_string
# invoke call method, pass in URL location
open(the_url) do |content|
  content.each_line { |line| the_string += line }
end

# START TEST CODE: This code tests whether we're really grabbing input from the remote URL.
# Comment the test output after you know your code is working.
# puts
# puts "BEGIN TESTING"
# puts the_string                                   # output fetched the_string? => yes we did.
# puts "The size: #{the_string.size}"               # get size of the_string? => 550
# puts "Original encoding: #{the_string.encoding}"  # get the_string 's encoding => UTF-8
# END TEST CODE #

# 2 different ways to print length of ruby string using .length and .size
puts "_________________Exercise #1:_length________________"
puts "Print the size/length of the_string."
puts "the length of the_string using .length method is: #{the_string.length}"
puts "the length of the_string using .size method is: #{the_string.size}"

puts
#Use String#squeeze to squeeze the extra whitespace characters (and only the whitespace characters) from the the_string
puts "_________________Exercise #2:_squeeze________________"
puts "Use String#squeeze to squeeze the extra whitespace characters (and only the whitespace characters) from the the_string."

puts "Squeezing out the extra whitespace characters results in:"
puts the_string.squeeze(" ")

puts

puts "_________________Exercise #3:_downcase________________"
puts "Use String#downcase to convert the_string into all lowercase. Print the result."
puts "when I change all characters in the_string to lowercase it looks like:"
puts the_string.downcase

puts

puts "_________________Exercise #4: upcase_________________"
puts "Use String#upcase to turn the_string into all uppercase. Print the result."
puts "when I change all characters in the_string to uppercase it looks like:"
puts the_string.upcase

puts


puts "_________________Exercise #5:_chomp x________________"
puts "Print the_string without the “X” that is at the end of of some of the lines."
puts "Removes any upper case 'X' from the end of EVERY line, if it exists."
# feed each line in the_string into a block
# inside the block, strip trailing white spaces, remove upper case 'X' from end of each line
the_string.each_line {|line|
  puts line.rstrip.chomp('X')
}

puts

puts "ALTERNATE SOLUTION #1: using gsub method"
#using gsub, replace any upper case X with a empty string
the_string.each_line { |line|
  puts line.rstrip.gsub(/[X]\z/,'')
}

puts

puts "_________________Exercise #6:_decimal, hex_______________"
puts "show the character itself, decimal value of the character, and hex value of each character in the_string"
# remove trailing and leading white spaces
# remove extra white space interspersed through, do not delete double letters
# pass each character in the string into the block
the_string.strip.squeeze(" ").each_byte {|letter|
  # block uses printf method which takes as argument, the format and object
  # print out each character and in: ascii (decimal) value, and hex value (using formatting standard %<format>)
  printf("Character is: %c | Decimal Value (ascii): %d | Hex Value: %x", letter,letter,letter)
  puts
}

puts

puts "_________________Exercise #7:_convert_to_array_______________"
puts "parse the_string into an array of words. Print the resulting array."
#turn string into array
print the_string.split

puts

puts "ANOTHER SOLUTION #1: set regex pattern to include spaces"
#also splitting on spaces using regex
print the_string.split(/ /)

puts

puts "ANOTHER SOLUTION #2: set regex pattern to split when it sees the 'a' character"
print the_string.split(/a+/)


puts "_________________Exercise #8:_crypt________________"
puts "apply a cryptographic hash to the_string"
# use crypt method, feeding it a salt_string. random string to "salt" the string.
encrypted_string = the_string.crypt("1gywf893uhfey98")
puts "encrypted_string is: #{encrypted_string}"

puts

puts "_________________Exercise #9_________________"
puts "Replace The Contents Of A String Object"
puts "the_string object id is: #{the_string.object_id}"

# get first 100 chars of the_string and clean it up & modify it
puts "## Performing string manipulations... ##"
new_string = the_string[0..99]
new_string = new_string.strip.squeeze.reverse.upcase

# cut out first 100 chars from the_string
the_string.slice!(0..99)

# append edited string "new_strinf" to the beginning of the_string
the_string.prepend(new_string)
puts "## Finished modifiying the reciever (the_string) ##"
puts "the_string now contains: #{the_string}"
puts "the_string object id is: #{the_string.object_id}"
