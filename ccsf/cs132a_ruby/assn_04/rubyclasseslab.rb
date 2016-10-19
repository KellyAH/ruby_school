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
require_relative 'keithhtmltable'

#time how long code takes to run.
t = Time.now
start = t.to_f

# initialize classes
ccsf_data = CcsfServer.new
user_data = ccsf_data.student_data_hash

# create student objects
students = []
# iterate thru student hashes, creating a new student object for each student.
user_data.map { |hash| students << Student.new(hash) }

# mangle gcos_field value for each student object
students.each do |student|
  student.mangled_gcos = student.mangled_gcos(student.gcos_field)
end

#students.each {|x| puts x.inspect}

header = Student.student_variable_names(students[0])
#p header
# make array of final student data to be fed into html table
final_student_data = students.map { |student| student.put_student_values_in_array }
#p final_student_data

student_table = KeithHtmlTable.new
student_table.make_table(header,final_student_data)


# record how long code took to run
finish = Time.now
print "Program Elapsed time: #{(finish.to_f - start.to_f).to_s}"
