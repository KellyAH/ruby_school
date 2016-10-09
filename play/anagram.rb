# Write a function called anagram() that collects all of the anagrams (words composed of the same letters) into arrays and returns them contained in an array. If the function fails, return nil. Ignore case when checking words. For example, “Cars” and “scar” are considered equal.
#WHAT AC REALLY MEANS: check if each word in array has a corresponding anagram in other words in array.

def anagram(array_of_words)

  all_anagrams = []       # store anagrams
  puts "before transformation: all_anagrams contains: #{all_anagrams}"


  array_of_words.each do |item|     # get each item in the array

    item = item.split(//)     # turn string into array

    # get all permutations for the word & turn back into a string
    word_permutations = item.permutation.to_a

    # turn each word permutations into a word
    new_words = []      # store permutations

    # populate array with all permutations
    word_permutations.each {|item| new_words << item.join }

    # store in anagrams array
    all_anagrams << new_words
  end

  all_anagrams

end

words = ['Cars', 'ofr','rof', 'for', 'potatoes', 'raCs', 'four','Scar', 'creams', 'scream']

# invoke method
print anagram(words)
