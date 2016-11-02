# Name: Kelly Hong
# Date: Tuesday, November 1, 2016
# File: exceptions.rb
# Desc:  write code that raises a variety of exceptions
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/24544
#

# ArgumentError
def multiply(str,int)
  str * int
end

puts "TRIGGERED: ArgumentError is rescued."
begin
  multiply('hi')
rescue ArgumentError => e
  puts "rescued error message is: #{e}"
  puts e.backtrace.join("<br>\n")
end

puts "-" * 10

# IndexError
def fetch_student(students,index)
  students.fetch(index)
end

students = %w[david, isabelle, luke]

puts "TRIGGERED: IndexError is rescued."

begin
  fetch_student(students, 5)
rescue IndexError => e
  puts "rescued error message is: #{e.message}"
  puts e.backtrace.join("<br>\n")
end

puts "-" * 10

# NameError
def addition(x,y)
  begin
    puts a
  rescue NameError => e
    puts "rescued error message is: #{e.message}"
    puts e.backtrace.join("<br>\n")
  end
end

puts "TRIGGERED: NameError is rescued."
addition(1,2)

puts "-" * 10

# NoMethodError
def speak(string)
  begin
    string.non_existant_method
  rescue NoMethodError => e
    puts "rescued error message is: #{e.message}"
    puts e.backtrace.join("<br>\n")
  end
end

puts "TRIGGERED: NoMethodError is rescued."
speak('Bunny')

# ZeroDivisionError
def divide(number, divisor)
  begin
    number / divisor
  rescue ZeroDivisionError => e
    puts "rescued error message is: #{e.message}"
    puts e.backtrace.join("<br>\n")
  end
end
puts "TRIGGERED: ZeroDivisionError is rescued."
puts divide(4, 0)

puts "-" * 10
