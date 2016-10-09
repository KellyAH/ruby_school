#The output is "how can this be true?". In Ruby, every expression evaluates to true when used in flow control, except for false and nil. Try the code above and give a values of 0, ''(empty string) and even the string 'false' to see the result yourself!

 a = 5
# a = 0
# a = ''
# a = "false"
#All above values for a will evaluate to TRUE.

if a
  #above expression checks if a exists. it does, thus A will always evaluate to TRUE. thus line 13 will NEVER be executed.
  puts "how can this be true?"
else
  puts "it is not true"
end
puts "________________________________"

#b = nil
b = false
if b
  #above expression checks if a exists. it does, thus A will always evaluate to TRUE. thus line 13 will NEVER be executed.
  puts "how can this be true?"
else
  puts "it is not true"
end