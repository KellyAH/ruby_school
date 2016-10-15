#!/usr/local/bin/ruby
#
# Name: Kelly Hong
# Date: 2016-10-19
# File: rubyclasseslab.cgi
# Desc: display the /etc/passwd information for all members of CS 132A as an HTML web page
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/23500
# ex output: hills.ccsf.edu/~khong5/cs132a/rubyclasseslab.cgi
#
# puts "Content-type: text/html"
#this is like </header> so apache knows to execute code after blank puts
# puts
#
# Program code starts here....
#
# puts "working"
#require '~/school/ruby_school/ccsf/cs132a_ruby/assn_04/student'
require_relative 'student'

puts "total pop: #{Student.total_population}"
#create an instance for each user in the CS 132A class.

a = [1, 2, 3, 4, 5, 6, 7]

john = Student.new(*a)
puts john.user_name

puts "total pop: #{Student.total_population}"

mary = Student.new(1, 2, 3, 4, 5, 6, 7)

puts "total pop: #{Student.total_population}"

# Populate each instance’s attributes with data derived from the student’s unique line in /etc/passwd
