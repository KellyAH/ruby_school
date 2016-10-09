# the power of group_by method

def anagram(word_array)
  # create hash's keys and values with group_by
  anagram_hash = word_array.group_by { |word| word.downcase.chars.sort }
  anagram_array = anagram_hash.values
end

words = ['Cars', 'ofr','rof', 'for', 'potatoes', 'raCs', 'four','Scar', 'creams', 'scream']
p anagram(words)
