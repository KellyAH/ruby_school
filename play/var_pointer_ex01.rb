a = "cat"
p a
p a.object_id

myarray = Array.new(3, a)

p myarray
p myarray.object_id


def get_array_contents(array)
  print "-" * 8
  puts "array contents:"
  p array
  puts "array contents ids:"
  array.each {|item| p item.object_id}
end

get_array_contents(myarray)

print "-" * 8
puts "before mutation of var a:"
p a
puts "after mutation of var a:"
a.upcase!
p a

get_array_contents(myarray)

print "-" * 8
puts "reassignment of a:"
a = "dog"
p a
p a.object_id

get_array_contents(myarray)
