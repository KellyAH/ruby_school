# Use the metaprogramming technique called ‘Open Class’ and make all instances of the String class respond to the method to_awesome_string. The method to_awesome_string prepends the value of the string with the word “awesome”.

class String
  def to_awesome_string
    # self refers to the class object instance
    self.prepend('awesome ')
  end
end

puts "Sauce".to_awesome_string
# returns: "awesome Sauce"

puts "rubears".to_awesome_string
# returns: "awesome rubears"
