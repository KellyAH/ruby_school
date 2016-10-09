#06/30/16
#Implement the Floyd's triangle..
#cannot use a ruby method that would solve it in 1 method
#ask for the range: how many rows you want triangle to be.
#
# 1
# 2 3
# 4 5 6
# 7 8 9 10
# 11  12  13  14  15
# going up till number of rows is reached.

#ask user number how wide triangle base is:
puts "how many rows you want the triangle to have."

#capture user input
rows = gets.chomp.to_i

puts "Your Floyd's Triangle to have #{rows} rows."


# #create array
# arr = (1...92).to_a
# #puts arr

number = 0
#number of rows
x = rows
#number of columns & iterator
y = 1

#build tringle
while x >= y

  #take number and keep adding 1 and printing to screen
  #number will equal the last value it evaluated to
  y.times do
    number += 1
    print "#{number} "
  end

  y += 1
  #create a new line to create rows
  puts " "
  #puts "you've iterated this many times: #{y}"

end

#############################
##RAJIV ANSWER##

puts "Enter the number of rows you want to print"
rows_requested = gets

row_count = 1
starting_number = 1

def print_number(row_count, starting_number)
  row_count.times do |k|
    print starting_number.to_s + ' '
    starting_number += 1
  end
  starting_number
end

while row_count <= rows_requested.to_i
  starting_number = print_number(row_count, starting_number)
  puts "\n"
  row_count += 1
end
