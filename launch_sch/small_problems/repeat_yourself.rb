# Wednesday, September 21, 2016
# https://launchschool.com/exercises/a018e581
# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# metod that prints out text X number of times
def repeat(string, integer)
  puts "#{string} \n" * integer
end

repeat('Hello', 3)
repeat('theCakeIsALie', 5)
