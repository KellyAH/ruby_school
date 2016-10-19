#!/usr/local/bin/ruby
#
# Name: Kelly Hong
# Date: Tuesday, October 18, 2016
# File: rubyclasseslab.cgi
# Desc: display the /etc/passwd information for all members of CS 132A as an HTML web page
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/23500
# ex output: http://hills.ccsf.edu/~kfreedma/cs132a/labs/rubyclasseslab.cgi
# URL: hills.ccsf.edu/~khong5/cs132a/rubyclasseslab.cgi
#
# puts "Content-type: text/html"

#this is like </header> so apache knows to execute code after blank puts
# puts
# invoke class files
require_relative 'student'
require_relative 'ccsfserver'
require_relative 'htmltable'

#time how long code takes to run.
t = Time.now
start = t.to_f

# get data from ccsf server
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

#create header from student object attributes
header = Student.student_variable_names(students[0])

# make array of final student data to be fed into html table
final_student_data = students.map { |student| student.put_student_values_in_array }

# create html table
student_table = HtmlTable.new
student_table.make_table(header,final_student_data)

# record how long code took to run
finish = Time.now
print "Program Elapsed time: #{(finish.to_f - start.to_f).to_s}"
