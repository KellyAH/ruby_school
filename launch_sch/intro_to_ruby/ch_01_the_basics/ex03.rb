=begin
https://launchschool.com/books/ruby/read/basics

Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.

1975
2004
2013
2001
1981

=end

# make hash
movies = {
  :dread => 2009,
  :frozen => 2013,
  :aladdin => 1992,
  :cars => 2006,
  :tangled => 2010,
  :the_thing => 1990
}

puts "my answer: via loop"
#loop thru hash
movies.each do |key, value|
  puts value
end

puts "my answer: via fetch values"
puts movies[:dread]
puts movies[:frozen]
puts movies[:aladdin]
puts movies[:cars]
puts movies[:tangled]
puts movies[:the_thing]


# "BOOK ANSWER:"
# movies = { jaws: 1975,
#            anchorman: 2004,
#            man_of_steel: 2013,
#            a_beautiful_mind: 2001,
#            the_evil_dead: 1981 }

# puts movies[:jaws]
# puts movies[:anchorman]
# puts movies[:man_of_steel]
# puts movies[:a_beautiful_mind]
# puts movies[:the_evil_dead]