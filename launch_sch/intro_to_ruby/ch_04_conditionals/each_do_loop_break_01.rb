#https://launchschool.com/exercises/0c0c4167
result = [1, 2, 3].each do |value|
  break value * 2 if value.even?
end

p result