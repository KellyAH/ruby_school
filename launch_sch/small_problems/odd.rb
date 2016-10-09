# Wednesday, September 21, 2016
# https://launchschool.com/exercises/dfa7db2c
=begin Write a method that takes one argument in the form of an integer or a float
; this argument may be either positive or negative.
This method should check if a number is odd, returning true if its absolute value is odd.
 Floats should only return true if the number is equal to its integer part and the integer is odd.
=end

def is_odd?(number)
   puts "Is number #{number} an odd number?:"
  number % 2 == 0 ? false : true

end


puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(7.1)
puts is_odd?(-5.0)