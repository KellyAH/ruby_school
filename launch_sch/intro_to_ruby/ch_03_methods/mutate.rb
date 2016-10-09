# Example of a method that modifies its argument permanently
# mutate.rb

a = [1, 2, 3]

def mutate(array)
  array.pop
end

# the diff b/w puts, print and p methods
puts "PUTS METHOD"
puts "Before mutate method: #{a}"
mutate(a)
puts "After mutate method: #{a}"

puts "________________________________"

puts "P METHOD"

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"

puts "________________________________"

puts "PRINT METHOD"

print "Before mutate method: #{a}"
mutate(a)
print "After mutate method: #{a}"