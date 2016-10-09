#Monday, July 11, 2016
#https://launchschool.com/books/ruby/read/variables#exercises
#Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.

puts "input your first name"
first_name = gets.chomp

puts "input your last name"
last_name = gets.chomp
#solution without method
# puts "Hello #{first_name} #{last_name}!"

#solution with method
def print_greeting(fname, lname)
  puts "Hello #{fname.capitalize } #{lname.capitalize}!"
end

print_greeting(first_name, last_name)