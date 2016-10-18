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

#time how long code takes to run.
t = Time.now
start = t.to_f


# # initizlize classes
# ccsf_data = CcsfServer.new


ruby_classroom = Student.new
# # ruby class user accounts
# p @user_accounts
p ruby_classroom.student_data


# record how long code took to run
finish = Time.now
print "Program Elapsed time: #{(finish.to_f - start.to_f).to_s}"
