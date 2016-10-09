def add_three(number)
  number + 3
#whatever line 2 evalates to is returned by the method
  #4 + 3 = 7
  #thus method returns 7
end

returned_value = add_three(4)

puts returned_value
#should print "7"

puts "________________________________"

# explicitly return a value

def add_three(number)
  return number + 3
end

returned_value = add_three(4)
puts returned_value

puts "________________________________"


def add_three(number)
  return number + 3 #this is returned by the method
  number + 4 #this line is not executed because it comes after the return
end

returned_value = add_three(4)
puts returned_value