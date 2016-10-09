#https://launchschool.com/books/ruby/read/basics#exercises
#Write a program that calculates the squares of 3 float numbers
#of your choosing and outputs the result to the screen.

x = 1.5
y = 2.5
z = 0.5

arr = [1.5, 2.5, 0.5]

#manually
# puts "square of #{x} is: #{x * x}"
# puts "square of #{y} is: #{y * y}"
# puts "square of #{z} is: #{z * z}"

#method for single value
# def find_square_root(num)
#   ans = num * num
#   return ans
# end

# puts find_square_root(x)

#method for many values
def find_square_root(array)
  array.each do |i|
    ans = i * i
    puts ans
  end
end


# puts find_square_root(x)
find_square_root(arr)