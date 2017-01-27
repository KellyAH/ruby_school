# https://launchschool.com/books/ruby/read/flow_control#ternaryoperator
# Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

def cap_string (string)
  string_length = string.length

  if string_length > 10
    new_string = string.upcase
    puts new_string
  else
    puts "string: '#{string}' is less than 10 characters."
  end


end

user_input = "hello world"
puts "user_input string: '#{user_input}' has #{user_input.length} many characters."

user_input2 = "yokai"
puts "user_input2 string: '#{user_input2} 'has #{user_input2.length} many characters."

#user_input = gets.chomp
#puts "you enteres: #{user_input}"



cap_string(user_input)
cap_string(user_input2)