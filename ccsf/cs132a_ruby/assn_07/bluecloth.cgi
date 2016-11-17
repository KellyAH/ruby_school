#!/usr/local/bin/ruby
#
# Name: Kelly Hong
# Date: 2016-11-16
# File: bluecloth.cgi
# Desc: uses the Ruby BlueCloth gem to convert Markdown to HTML.
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/25740?module_item_id=101469
# ex output: http://hills.ccsf.edu/~kfreedma/cs132a/examples/bluecloth.cgi
# my output: http://hills.ccsf.edu/~khong5/cs132a/week12lab/bluecloth.cgi
#
# tells apache this to be read as html code
puts "Content-type: text/html"
#this is like </header> so apache knows to execute code after blank puts
puts
#
# specifiy a non-standard gem repository location via the GEM_HOME environment variable
ENV['GEM_HOME']='/students/khong5/mygems'

# check that gem is called in script
begin
  gem "bluecloth"
rescue LoadError
  puts "bluecloth gem failed to install"
end

# import gem
require 'bluecloth'

# create empty string to store the concatinated page contect data into
#source_text = String.new("")
#puts "source_text is: #{source_text.inspect}"

source_url = "/students/khong5/public_html/cs132a/week12lab/oliver.markdown.txt"
#
# get file contents
text_file = File.open(source_url)
contents = text_file.read

# instantiate bluecloth gem and pass in source text
markdown_text = BlueCloth.new(contents)
# output text marked up by gem
puts markdown_text.to_html
