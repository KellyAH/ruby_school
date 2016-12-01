# Name: Kelly Hong
# Date: Tuesday, November 29, 2016
# File: hpricot_scraper.rb
# Desc: Use hpricot to print the the inner html of all of the A links on the  CCSF's index.html page.
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/26743#submit
# example: http://hills.ccsf.edu/~dputnam/cs132a/hpricot.cgi

# get required libraries
# library to do network requests
require 'open-uri'
require 'hpricot'

# read the HTML for the CCSF.edu home page at http://ccsf.edu.
url = 'http://ccsf.edu'

#Load an HTML Page using the hpricot gem
doc = Hpricot(open(url))

# extract the text labels (known as the inner HTML) of all of the <a> elements in the index.html page.
# get all anchor tag <a> Elements
anchor_tag_elements = doc.search("//a")

# create a file named scraper.txt and write the output to it.
 scraped_text = File.new("scraper.txt", "w+")
 scraped_text.close

# get inner html elements for a tag
def atag_inner_elements(file_handle, anchor_tag_elements)
  anchor_tag_elements.each do |tag|

    # write entries to file each on a new line
    file_handle.puts tag.inner_html
  end
end


# open scraper.txt file.
# write to scraper.txt file and append answers to it
File.open("scraper.txt", "w+") { |file_handle| atag_inner_elements(file_handle, anchor_tag_elements)}

