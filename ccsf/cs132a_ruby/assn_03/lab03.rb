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
# check if a string is a palindrome
# this implementation does not require the additional memory to reverse the string. should theoretically be ~2 times faster
def palindrome?(string)
  # initialize two iterators at each end of the string
  i = 0
  j = string.length - 1

  # continue checking one of the iterators overtakes the other
  while i < j

    # these two while loops will increment/decrement the iterators if they encounter a non-alphabet character
    while string[i] =~ /[^a-zA-Z]/
      i += 1
    end
    while string[j] =~ /[^a-zA-Z]/
      j -= 1
    end

    # we compare only alphabetic characters at this point
    if string[i].downcase != string[j].downcase
      # early return if we find that characters don't match
      return false  # use the return keyword if you want to return early
    end

    # we must increment and decrement the indices at the end of the while loop
    # i and j will eventually reach the middle of the string and break the loop
    i += 1
    j -= 1
  end

  # no need for return keyword, but you might consider using return keyword if you encounter strange behavior
  true
end

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

def count_sentences(input)
  # scan will match any regex and return an array of matches
  # the regex [a-z][\!\?\.] will match any lowercase alphabetic character followed by ! ? .
  # count returns the size of the array, which corresponds with number of sentences
  sentence_count = input.scan(/[a-z][\!\?\.]/).count
  
  #return nil if file is empty
  sentence_count == 0 ? nil : sentence_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "oliver.txt contains #{count_sentences(file_text)} sentences."

puts "If an empty file is passed into the count_sentences method, it returns: #{count_sentences(empty_text).inspect}"

puts "-" * 8
puts "EX: 02: count_sentences() ALTERNATE SOLUTION - if You are a grammar snob about sentences."
puts "-" * 8

puts "-" * 5 + "SENTENCES ARE...IF YOU ARE A GRAMMAR SNOB" + "-" * 5
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
  sentence_count = input_string.scan(/\'?[A-Z].+([\?\!\.]\'?(\s{1,2}[A-Z]|\n{2})|([a-z]{2}\.|[\?\!])\'?\n[A-Z])/).count
  sentence_count == 0 ? nil : sentence_count
end

puts "If you are a grammar snob, and strict about definition of a sentences, oliver.txt contains #{count_explicit_sentences(file_text)} sentences."

puts "If an empty file is passed into the count_sentences method, it returns: #{count_sentences(empty_text).inspect}"

 puts "-" * 8
 puts "EX: 03: count_paragraphs()"
 puts "-" * 8

# Use the oliver.txt you used in the previous problem and write a function called count_paragraphs() that counts the number of paragraphs in the text. In oliver.txtthe paragraph delimiter is consecutive newline characters, like this: \n\n. Your function should return the number of paragraphs or nil, like the preceding problem.

puts "assignment Criteria: all paragrahs end with two new lines /n/n"

def count_paragraphs(input_string)
  # iterate thru all lines looking for end of paragraphs
  # size is returned, same as count
  paragraph_count = input_string.scan(/\n\n/).size

  paragraph_count == 0 ? nil : paragraph_count
end

puts "oliver.txt contains #{count_paragraphs(file_text)} paragraphs."

puts "If an empty file is passed into the count_paragraphs method, it returns: #{count_paragraphs(empty_text).inspect}"

puts "-" * 8
puts "EX: 03: ALTERNATE SOLUTION - count_paragraphs() - for grammar snobs"
puts "-" * 8

puts "-" * 8 + "ASSUMPTIONS" + "-" * 8
puts "* title & header are not paragraphs"

def count_explicit_paragraphs(input_string)
  paragraph_count = input_string.scan(/[\!\?\.]\'?\n(\n|\z)\'?[A-Z]?/).size

  paragraph_count == 0 ? nil : paragraph_count
end

# invoke methods
#open & read file with contents
file_text = file_contents(file_loci)

#open & read empty file
empty_text = file_contents(empty_file)

puts "if you are a grammar snob and strict about paragrahs, then oliver.txt contains #{count_explicit_paragraphs(file_text)} paragraphs."

puts "-" * 8
puts "EX: 04: anagram()"
puts "-" * 8

# Write a function called anagram() that collects all of the anagrams (words composed of the same letters) into arrays and returns them contained in an array. If the function fails, return nil. Ignore case when checking words. For example, “Cars” and “scar” are considered equal.
#WHAT AC REALLY MEANS: check if each word in array has a corresponding anagram in other words in array.

# this implementation hashes in a more efficient manner
def anagram(array_of_words)

  # 1. create new hash 'words_hash'
  words_hash = {}

  # 2. iterate through each item in the array of words
  #   for each word in the array, attempt to create a cleaned, lowercase, sorted version as the key
  #     if the key doesn't exist, create a new value which is an array containing one element, the uncleaned word.
  #     if the key exists, then append the word to the value, which is a word array
  array_of_words.each {|word| 
    cleaned = word.downcase.split(//).sort.join
    
    if words_hash.include?(cleaned)
      # cleaned already exists as a key, appending its value with word
      words_hash[cleaned].push(word)
    else
      # cleaned is not yet a key, create new key cleaned with value [word]
      words_hash[cleaned] = [word]
    end
  }
  puts

  # 3. return the values of the hash, which is a list of arrays since our values are arrays which we've been pushing words into
  words_hash.values
end

words = ['Cars', 'ofr','rof', 'for', 'potatoes', 'raCs', 'four','Scar', 'creams', 'scream']

# invoke method
puts "involking anagram() returns:"
print anagram(words)
