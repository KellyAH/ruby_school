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
require_relative 'ccsfserver'
#require_relative 'htmltable'

#time how long code takes to run.
t = Time.now
start = t.to_f


# # initizlize classes
ccsf_data = CcsfServer.new
user_data = ccsf_data.student_data_hash



# create student objects
students = []
user_data.map {|hash| students << Student.new(hash) }

puts "#{Student.total_population}"

# puts "before"
# p students

# mangle gcos_field data for each student object
students.each do |student|
  student.mangled_gcos = student.mangled_gcos(student.gcos_field)
end

# puts "After"
# p students
#
# puts "After QQQQ"
keys = students[0].instance_variables
p keys
p keys.class
keys_as_strings = keys.map {|key| key.slice(1,key.length).to_s}
#keys_as_strings = keys.map {|key| key.to_s}
p keys_as_strings
p keys_as_strings.class

students.each {|student| p Student.student_full_data(student, keys_as_strings) }


#students.map {|student| student_full_data << student.instance_variable_get(*keys)}


#student_table = htmltable.new.make_table(header_data, )


# record how long code took to run
finish = Time.now
print "Program Elapsed time: #{(finish.to_f - start.to_f).to_s}"
