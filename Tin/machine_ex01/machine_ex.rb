# puts "-" * 11
# puts "EX_01"
#
# puts "hello world"
#
# puts "-" * 11
# puts "EX_02"
#
#
# def ask_for_input
#   puts "please enter a number:"
#   user_input = gets.chomp.to_i
#   #puts "class: #{user_input.class}"
#   user_input
# end
#
# def cal_sum(number)
#   answer = (1..number).reduce(:+)
#   answer
# end
#
# #ask_for_input
# puts cal_sum(ask_for_input)
#

# puts "-" * 11
# puts "EX_03"



# def ask_for_input
#   puts "please enter a number:"
#   user_input = gets.chomp.to_i
#   #puts "class: #{user_input.class}"
#   user_input
# end
#
# def multiple_of_three_five_arry(number)
#   range = (1..number)
#   puts "range is: #{range}"
#
#   final_array = []
#
#   range.each { |x| final_array << x if x%3 == 0 || x%5 == 0 }
#
#   final_array
# end
#
# def cal_sum(range)
#   answer = range.reduce(:+)
#   answer
# end
#
# #ask_for_input
# my_arry = multiple_of_three_five_arry(ask_for_input)
#
# puts cal_sum(my_arry)


puts "-" * 11
puts "EX_04"

def ask_for_input
  puts "please enter a number:"
  user_input = gets.chomp.to_i
  #puts "class: #{user_input.class}"
  user_input
end

def multiple_of_three_five_arry(number)
  range = (1..number)
  puts "range is: #{range}"

  final_array = []

  range.each { |x| final_array << x if x%3 == 0 || x%5 == 0 }

  final_array
end

def cal_sum(range)
  answer = range.reduce(:+)
  answer
end

#ask_for_input
my_arry = multiple_of_three_five_arry(ask_for_input)

puts cal_sum(my_arry)
