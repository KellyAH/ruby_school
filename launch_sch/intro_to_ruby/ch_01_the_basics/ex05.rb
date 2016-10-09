=begin
https://launchschool.com/books/ruby/read/basics

Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

if number = 5, the factorial = 5 * 4 * 3 * 2 * 1
=end


#get starting number
puts "input a number"
num = gets.chomp.to_i
fed_num = num

puts "you entered: #{num}"

#create array to save factorial numbers to
factorials = [num]

#loop to create factorials
while num > 1
  num = num - 1

  #append to array
  factorials << num
end

#create var that stores final answer
# = 1 , cause we are doing multiplication, anything * 1 = itself
total = 1

#calcualte / multiply factorial numbers [5,4,3,2,1]
#loop thru array for each item in array i * i
for i in factorials
  total = total * i
end

puts "factorial of #{fed_num} is: #{total}"


# ###WITH RAJIV'S METHOD
# num = n
# def factorial(n)
#     return 1 if n == 1
#     return n * factorial(n-1)
# end
#
# factorial(n)
#
# ###WITH RAJIV'S RECURSIVE METHOD w/ turnary?
# def factorial(n)
#     n == 1 ? 1 : n * factorial(n-1)
# end