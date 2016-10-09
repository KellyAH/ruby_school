#Tuesday, June 21, 2016
#Rajiv challenge
##AC
#cannot use a ruby method that would solve it in 1 method
#must work with ANY sentence string obj
#BONUS: must work with sentance with odd or any number of words
#reverse the string word by word:
#Ex: Given s = "the sky is blue", return "blue is sky the".
#make this into ruby class "edit_string" with method "swap_string_values"


##KAH ANSWER##
#ask user to input a sentance
puts "input a sentance so we can flip it's words around."
new_string = gets.chomp
puts "you entered: #{new_string}"

my_string = "the sky is blue"
my_string = new_string
puts "input is: #{my_string}"

#convert string into array. via String.split method. http://ruby-doc.org/core-2.3.0/String.html#method-i-split
my_array = my_string.split
#puts "let's turn your sentance into an array of strings: #{my_array}"
#use methods in array class to manipulate array. http://ruby-doc.org/core-2.2.0/Array.html

#set counter to control when loop stops.
counter = 0

#find halfway point of array so itieration only runs on half of the array.
half_of_length = my_array.count / 2
#puts "array chopped in half: #{half_of_length}"

#iterate thru array - for each item in array do this...
  my_array.each_with_index do |item, index|

    #grabbed indexes I want
    #puts "1st value I want: #{my_array[index]}"
    #puts "1st index i want: #{index}"

    #get the index number for the last item in the array.
    last_index = my_array.count - 1

    #use math & the index number of the value you are iterating on, to find out the index number of the value you want to swap it with.
    targted_index = last_index - index
    # puts "2nd index I want: #{targted_index}"
    # puts "2nd value I want: #{my_array[targted_index]}"

    #save 1st index's value because it's the 1st one that will be reassigned to a new value. and you don't wanna lose it.
    my_first_value = my_array[index]
    #puts "my_first_value #{my_first_value}"

    #exchange index values
    my_array[index] = my_array[targted_index]
    my_array[targted_index] = my_first_value

    counter += 1
    #puts "my counter is at:#{counter}"

    #stop iterating thru array after iterating thru half the items in the array
    break if counter == half_of_length

  end

# turn array into string seperated by a space
puts "your new sentence is: #{my_array.join(" ")}"

####DO IT WITH SINGLE RUBY methodirb(main):067:0> b
# => "the sky is blue"
# irb(main):068:0> b.split.reverse.join(" ")
# => "blue is sky the"

#############################
##RAJIV ANSWER##
# reverse_string('the sky is blue')
string_to_array = 'the sky is blue'.split

array_length = string_to_array.count

i = -1

output_array = []

while i >= -(array_length)
  output_array << string_to_array[i]
  i += -1
end

puts output_array.join(' ')

#############################
##JAYGO ANSWER##

# reverse_string('the sky is blue')
string_to_array = 'the sky is blue'.split

array_length = string_to_array.count

output_array = []

while array_length > 0
  array_length -= 1
  output_array << string_to_array[array_length]
end

puts output_array.join(' ')

#############################
##MITCH ANSWER##

# reverse_string('the sky is blue')
# reverse_string('blue is sky the')
string_to_array = 'the sky is blue'.split

array_length = string_to_array.count

i = -1

output_array = []

string_to_array.each do |item|
  output_array.unshift item
end

puts output_array.join(' ')