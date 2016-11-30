# Name: Kelly Hong
# Date: Tuesday, November 29, 2016
# File: open_uri.rb
# Desc: Write a script that reads the content of the URL and prints it to a text file named uri_content.html. (open and write to the uri_content.html file.)
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/26743#submit
# example: http://hills.ccsf.edu/~dputnam/cs132a/open_uri.cgi

# get required libraries
# library to do network requests
require 'open-uri'
require 'net/http'

# go to url
url = URI.parse('http://hills.ccsf.edu/~dputnam/cs132a/form.cgi')

# reads the content of the URL
response = Net::HTTP.get_response(url)

#puts "QQQQQ : response is: #{response}"
#puts "QQQQQ : response body is: #{response.body}"

# create uri_content.html file.
result_file = File.new("uri_content.html", "w+")
result_file.close

# open uri_content.html file.
# write to the uri_content.html file.
File.open("uri_content.html", "a+") { |file| file.write(response.body) }


# read file to check contents
puts File.read("uri_content.html")
