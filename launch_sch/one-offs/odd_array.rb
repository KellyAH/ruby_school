#Sunday, September 25, 2016
#https://launchschool.com/blog/declarative-thinking-with-higher-order-functions-and-blocks
#“Pick out all the odd numbers from the array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] and print them out.

a =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# iterate thru each item in array
# pass to block to check if each item is odd
# return all add values
# odd number return a remainder when divided by 2
odd_numbers = []

## EACH DO BLOCK
# a.each do |x|
#   if x%2 != 0
#     odd_numbers << x
#   end
#   odd_numbers
# end
#
# p odd_numbers


## EACH DO BLOCK
# a.each do |x|
#     odd_numbers << x if x%2 != 0
#   end
#
# p odd_numbers


## EACH DO BLOCK
odd_numbers = a.select {|x| x.odd?}

p odd_numbers