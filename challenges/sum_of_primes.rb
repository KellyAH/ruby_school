#Thursday, August 10, 2016
#sum of the first 1000 primes


def divisor(input_number)
  output_array = []
  while input_number > 2
    output_array << input_number - 1
    input_number -= 1
  end
  output_array
end

def divide(input_number, input_array)
  not_prime = true
  input_array.each do |item|
    remainder = input_number % item
    if remainder == 0
      not_prime = false
      break
    end
  end
  not_prime
end

def add(input_array)
  sum = 0
  input_array.each do |x|
    sum += x
  end
  sum
end

num = 3
output = [2]
while output.count < 1000
  output << num if divide(num, divisor(num))
  num += 1
end
puts add(output)
