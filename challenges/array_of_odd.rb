# check if items in array are odd

a = (1..10).to_a
p a

a.each {|x| result = x.odd?; p result }
