#!/usr/local/bin/ruby
# Name: Kelly Hong
# Date: Wednesday, September 14, 2016
# File: arr_methods.rb
# Desc: Uses Array methods to manipulate an array created from a the_string
# ex output: http://hills.ccsf.edu/~kfreedma/cs132a/lab2.cgi
# ASSN URL: https://ccsf.instructure.com/courses/2612/assignments/21798

require "open-uri" # Use this library to do network requests


puts "-" * 8
puts "SETUP"
puts "-" * 8


# 1. Code from Lab 1 to fetch the_string from a URL
# Fetch the lab 1 working string into a variable named the_string

the_string = ""    # Initialize this string
the_url = "http://hills.ccsf.edu/~kfreedma/cs132a/the_string.cgi"

open(the_url) do |content|
  content.each_line { |line| the_string += line }
end

puts "the original the_string contains:"
print the_string
puts "the_string contains #{the_string.length} characters."

# Create an array that contains all of the characters in the_string (from Lab 1) as separate elements.
# regex: . = any single char, m =  make dot match newlines
# create this array of characters with the String#scan method.
array_of_chars = the_string.scan(/./)
puts "The new array 'array_of_chars' contains elements that are each character in the_string:"
print array_of_chars
puts

array_size = array_of_chars.size
puts "array_of_chars array contains #{array_size} elements."

puts "-" * 8
puts "TASK 01"
puts "-" * 8

# Create two arrays by splitting the array of characters into two parts.
# find 1/3 part of the array
first_third_of_array = array_size / 3
puts "#{array_size} divided by 3 is #{first_third_of_array}"

# create array which will contain the first 1/3 of the original array.
# cut out first 1/3 of array
arr1 = array_of_chars.slice(0,first_third_of_array)
puts "The contents of arr1 is: #{arr1}"
puts "arr1 contains #{arr1.length} items."

puts "-" * 8
puts "TASK 02"
puts "-" * 8

# contains the rest of the elements in the original array.
arr2 = array_of_chars.slice(first_third_of_array..-1)
puts "The contents of arr2 is: #{arr2}"
puts "arr2 contains #{arr2.length} items."


# check size of arfr1 + arr2 should be the same as the size of the original array.
total_size = arr1.size + arr2.size
puts "the total size of arr1 + arr2 is: #{total_size}"


puts "-" * 8
puts "TASK 03"
puts "-" * 8

# Print the set of elements common to both arr1 and arr2, with no duplicates.

puts "the set of elements common to both arr1 and arr2 is: #{arr2 & arr1}"

puts "-" * 8
puts "TASK 04"
puts "-" * 8

# Print the difference between arr1 and arr2.
puts "the difference between arr1 and arr2 is: #{arr1 - arr2}"

puts "-" * 8
puts "TASK 05"
puts "-" * 8

# Print the difference between arr2 and arr1.
puts "the difference between arr2 and arr1 is: #{arr2 - arr1}"

puts "-" * 8
puts "TASK 06"
puts "-" * 8

# Print in double-quotes the elements at the end of arr1 and arr2.
# Find the elements using the Array#at method and a negative index.
puts "the last element in arr1 is: #{arr1.at(-1).inspect}"
puts "the last element in arr2 is: #{arr2.at(-1).inspect}"


puts "-" * 8
puts "TASK 07"
puts "-" * 8
# Print in double-quotes the first elements of arr1 and arr2.
# Do not use something like a[0] to find the first elements
puts "the first element of arr1 is: #{arr1.first().inspect}"
puts "the first element of arr2 is: #{arr2.first().inspect}"


puts "-" * 8
puts "TASK 08"
puts "-" * 8
# Convert all elements of arr2 to uppercase and remove all of the elements that consist of white space characters.
# For this lab, whitespace characters are: space, tab, and newline (\n).
# remove space, tab, and newline (\n) from array
clean_arr2 = arr2.collect{|x| x.strip.upcase}

# remove empty strings from array
puts "arr2 before delete empty string contains: #{clean_arr2}"
puts "arr2 after delete empty string #{arr2.size} elements"
clean_arr2.delete("")

puts "arr2 cleaned up contains: #{clean_arr2}"
puts "arr2 cleaned up contains #{clean_arr2.size} elements."

puts "arr1 contains #{arr1.size} elements"

# Insert arr2 into arr1 at index 100.
arr1.insert(101, clean_arr2)

# Display arr1. You will see that arr2 is now located inside of arr1.
puts "arr1 now contains the modified arr2: #{arr1}"
puts "arr1 now contains #{arr1.size} elements"

puts "-" * 8
puts "TASK 09"
puts "-" * 8

# Flatten arr1, then remove any white space characters. Display the array. Print the result.
puts "before flattening, arr1 contains #{arr1.size} elements"

arr1.flatten!
puts "flattened arr1 looks like: #{arr1}"
puts "after flattening, arr1 contains #{arr1.size} elements"

# remove any white space characters.
clean_arr1 = arr1.collect{|x| x.strip}

arr1 = clean_arr1

puts "arr1 cleaned up contains: #{arr1}"
puts "arr1 cleaned up contains #{arr1.size} elements."

# remove empty strings from array
puts "arr1 before delete empty string contains: #{arr1}"
arr1.delete("")
puts "arr1 after delete empty string #{arr1.size} elements"

puts "arr1 cleaned up contains: #{arr1}"
puts "arr1 cleaned up contains #{arr1.size} elements."

puts "-" * 8
puts "TASK 10"
puts "-" * 8

# Using Array#collect!, add an exclamation point (!) to each element of arr1. Print the result.
arr1.collect! {|item| item + "!"}

puts "when bang symbols added to each elements in arr1 it looks like: #{arr1}"

puts "-" * 8
puts "TASK 11"
puts "-" * 8

# Use Array#pop to remove the last element off the array. Print the removed element and printarr1.
puts "last element in arr1 is: #{arr1[-1]}"
saved_last_element = arr1.pop
puts "arr1 with popped off last element now contains: #{arr1}"
puts "last element in arr1 is now: #{arr1[-1]}"

puts "-" * 8
puts "TASK 12"
puts "-" * 8

# Insert the element popped off in previous step into position 0 (front) of the array. Print the result.
arr1.unshift(saved_last_element)
puts "arr1 with #{saved_last_element} appended to the front now contains: #{arr1}"

puts "-" * 8
puts "TASK 13"
puts "-" * 8


puts "arr1 before clean up contains: #{arr1.size} elements."
# Using Array#select!, remove all of the elements that do not contain uppercase letters. Print the result.
arr1 = arr1.select { |item| item =~ /[A-Z]/ }

puts "arr1 with all non uppercase removed, now contains: #{arr1}"
puts "arr1 now contains #{arr1.size} elements."