=begin
https://launchschool.com/books/ruby/read/basics

Use the modulo operator, division, or a combination of both to take a 4 digit number and return the digit in the thousands place, the hundreds place, the tens place and the ones place.

if number was: 5789

  return 5
  then 7
  then 8
  then 9

=end

puts "my 4 digit number is: 6532"
puts 6532 / 1000

puts "return the digit in the hundreds place"
puts 6532 % 1000 / 100

puts "return the digit in the tens place"
puts 6532 % 1000 % 100 / 10

puts "#BOOK ALT ANSWER"
puts 6532 % 100 / 10

puts "return the digit in the ones place"
puts 6532 % 1000 % 100 % 10

puts "#BOOK ALT ANSWER"
puts 6532 % 10