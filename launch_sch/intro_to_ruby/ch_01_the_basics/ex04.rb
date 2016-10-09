=begin
https://launchschool.com/books/ruby/read/basics

Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.

=end

# make hash
dates = [2009, 2013, 1992, 2006, 2010, 1990]

puts "my answer: via loop thru array"
#loop thru array
dates.each do |value|
  puts value
end

puts "my answer: via fetch values"
puts dates[0]
puts dates[1]
puts dates[2]
puts dates[3]
puts dates[4]
puts dates[5]

# "BOOK ANSWER:"