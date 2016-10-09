#!/usr/local/bin/ruby
# date: Wednesday, September 28, 2016
# name: Kelly Hong
# file: lab03.rb
# desc: hashes and Functions
# URL: https://ccsf.instructure.com/courses/2612/assignments/22288

puts "-" * 8
puts "EX: 01: palindrome?()"
puts "-" * 8

# create palindrome funct that returns boolean
def palindrome?(string)

  # check if a string is a palindrome

  #clean up string (remove non letter chars, puncuation, white space)
  cleaned_up_string = ""
  string.scan(/[a-zA-Z]/) {|char| cleaned_up_string += char.downcase}

  # ignore case, punctuation, and non-word characters (“a character that a Ruby regular expression, such as /\W+/ would treat as a non-word character.)

  # return True or False
  # should not print anything
  cleaned_up_string == cleaned_up_string.reverse ? true : false
end

empty_palindromes = []

palindromes = [
    "Dennis, Nell, Edna, Leon, Nedra, Anita, Rolf, Nora, Alice, Carol, Leo, Jane, Reed, Dena, Dale, Basil, Rae, Penny, Lana, Dave, Denny, Lena, Ida, Bernadette, Ben, Ray, Lila, Nina, Jo, Ira, Mara, Sara, Mario, Jan, Ina, Lily, Arne, Bette, Dan, Reba, Diane, Lynn, Ed, Eva, Dana, Lynne, Pearl, Isabel, Ada, Ned, Dee, Rena, Joel, Lora, Cecil, Aaron, Flora, Tina, Arden, Noel, and Ellen sinned.",
    "Depardieu, go razz a rogue I draped.",
    "Desserts I stressed.",
    'Mister, mister, on a see-saw with your sister.',
    "Detartrated.",
    "Devo met a Mr., eh, DNA and her mate moved.",
    "Di as dad said.",
    'abracadabra!',
    "Did I draw Della too tall, Edward? I did?",
    "Dior droid.",
    "'DNA-land.'",
    "Do geese see god?",
    'Do good? I? No. Evil anon I deliver. I maim nine more hero-men in Saginaw, sanitary sword a-tuck, Carol, I. Lo! Rack, cut a drowsy rat in Aswan. I gas nine more hero-men in Miami. Reviled, I (Nona) live on. I do, O God.',
    'Do nine men interpret?" "Nine men," I nod.',
    'Almost every sentence is NOT a palindrome! How unfair!'
]

# get 2nd palindrome
# print palindromes[1]

# iterate thru array of palindrome and print out if each is a palindrome or not
palindromes.each {|item| puts palindrome?(item)}

puts "-" * 8
puts "EX: 02: count_sentences()"
puts "-" * 8


# Write a function called count_sentences() that counts the number of sentences in the file. Sentences end with the characters “.”, “!”,“?”. Your function should return the count or, if the file is empty, return nil.

## get required libraries
# library to do network requests
require "open-uri"

# the page where text is located
file_loci = "files/oliver.txt"
empty_file = "files/empty_file.txt"

def file_contents(file_loci)
  file_content = open(file_loci).read()       # open & read file's contents
  file_content.to_s       # return contents of file as a string
end

# counts the number of sentences in the file.
puts "method according to assignment specs: 'Sentences end with the characters “.”, “!”,“?”.'"


def count_sentences(input_string)

  line_count = 0        # keep track of number of lines

  # iterate thru all lines looking for end of sentences
  input_string.each_line do |line|
    line_count += 1 if line =~ /[a-z](\!|\?|\.)/
  end
  #return nil if file is empty
  line_count == 0 ? nil : line_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "oliver.txt contains #{count_sentences(file_text)} sentences."

puts "If an empty file is passed into the count_sentences method, it returns: #{count_sentences(empty_text).inspect}"

puts "-" * 8
puts "EX: 02: count_sentences() ALTERNATE SOLUTION - if You are a grammer snob about sentences."
puts "-" * 8

puts "-" * 5 + "SENTENCES ARE...IF YOU ARE A GRAMMER SNOB" + "-" * 5
puts "Sentences always begin with:"
puts "* a Capital Letter"
puts "* single quote, followed by a Capital Letter"

puts "Sentences end with '?' or '!' or '.' followed by:"
puts "* 2 spaces and a Capital Letter between A-Z."
puts "* 1 space and a Capital Letter between A-Z."
puts "* 2 newlines "
puts "* Sentences end with 2 lowercase characters, a period, a new line, a Capital Letter between A-Z."
puts "* Sentences end with '?' or '!, a new line, a Capital Letter between A-Z."
puts "* same rules apply to sentences inside single quotes"
puts "* a long quote can contain multiple sentences"


def count_explicit_sentences(input_string)

  line_count = 0        # keep track of number of lines

  # iterate thru all lines looking for end of sentences
  input_string.each_line do |line|
     line_count += 1 if line =~ /!Mr.|!Mr\.\n|([\!|\?|\.]\s\s[A-Z])|([\!|\?|\.]\n\n)|([a-z][a-z]\.\n[A-Z])|([\!|\?]\n[A-Z])|([\!|\?|\.]\n\z)|([\!|\?|\.]\'\n\n)|([\!|\?|\.]\'\s\s)|[a-z][a-z]\.\s[A-Z]|([\!|\?|\.]\s\s\'[A-Z])/
  end
  #return nil if file is empty
  line_count == 0 ? nil : line_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "If you are a grammer snob, and strict about definition of a sentences, oliver.txt contains #{count_explicit_sentences(file_text)} sentences."

 puts "-" * 8
 puts "EX: 03: count_paragraphs()"
 puts "-" * 8

# Use the oliver.txt you used in the previous problem and write a function called count_paragraphs() that counts the number of paragraphs in the text. In oliver.txtthe paragraph delimiter is consecutive newline characters, like this: \n\n. Your function should return the number of paragraphs or nil, like the preceding problem.

puts "assignment Criteria: all paragrahs end with two new lines /n/n"

# the page where text is located
file_loci = "files/oliver.txt"
empty_file = "files/empty_file.txt"

def count_paragraphs(input_string)

  paragraph_count = 0     # track # of paragraphs

  # iterate thru all lines looking for end of paragraphs
  new_lines_count = input_string.scan(/\n\n/)
  paragraph_count = new_lines_count.size

  #return nil if file is empty
  paragraph_count == 0 ? nil : paragraph_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "oliver.txt contains #{count_paragraphs(file_text)} paragraphs."

puts "If an empty file is passed into the count_paragraphs method, it returns: #{count_paragraphs(empty_text).inspect}"

puts "-" * 8
puts "EX: 03: ALTERNATE SOLUTION - count_paragraphs() - for grammer snobs"
puts "-" * 8

puts "-" * 8 + "ASSUMPTIONS" + "-" * 8
puts "* title & header are not paragraphs"

def count_explicit_paragraphs(input_string)

  paragraph_count = 0     # track # of paragraphs

  # iterate thru all lines looking for end of paragraphs
  input_string.each_line do |line|
    paragraph_count += 1 if line =~ /[\!|\?|\.]\'\n\n\'[A-Z]|[\!|\?|\.]\'\n\n[A-Z]|[\!|\?|\.]\n\n\'[A-Z]|[\!|\?|\.]\n\n[A-Z]|[\!|\?|\.]\'\n\n]|[\!|\?|\.]\n\z/

  end
  #return nil if file is empty
  paragraph_count == 0 ? nil : paragraph_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "if you are a grammer snob and strict about paragrahs, then oliver.txt contains #{count_explicit_paragraphs(file_text)} paragraphs."


puts "-" * 8
puts "EX: 04: anagram()"
puts "-" * 8

# Write a function called anagram() that collects all of the anagrams (words composed of the same letters) into arrays and returns them contained in an array. If the function fails, return nil. Ignore case when checking words. For example, “Cars” and “scar” are considered equal.
#WHAT AC REALLY MEANS: check if each word in array has a corresponding anagram in other words in array.

def anagram(array_of_words)

words_hash = Hash.new()
answer = []
matching_words = []

# store original word and cleaned up and sorted word in a hash
array_of_words.each {|word| words_hash[word] = word.downcase.split(//).sort.join }

  # compare each key value to other values in the array
  words_hash.each do |starting_key, starting_value|

    matching_words = []    # reassign array to empty array so it can be filled with new words

    # save matching hash key values
    words_hash.each_pair {|key, value| matching_words << key if value == starting_value}

    # fill answer array with unique matching_words
    answer << matching_words unless answer.include?(matching_words)
  end
  answer
end

words = ['Cars', 'ofr','rof', 'for', 'potatoes', 'raCs', 'four','Scar', 'creams', 'scream']

# invoke method
puts "involking anagram() returns:"
print anagram(words)
