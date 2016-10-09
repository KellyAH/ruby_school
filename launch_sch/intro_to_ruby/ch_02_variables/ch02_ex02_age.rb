#Monday, July 11, 2016
#https://launchschool.com/books/ruby/read/variables#exercises
#Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.

# output of age.rb for someone 20 yrs old

# How old are you?
# In 10 years you will be:
# 30
# In 20 years you will be:
# 40
# In 30 years you will be:
# 50
# In 40 years you will be:
# 60

puts "How old are you?"
age = gets.chomp.to_i

puts "How many years do you want to add to your age? (input a number)"
year = gets.chomp.to_i


#method that takes any age and year
def get_age(age, year)
  final_age = age + year
  puts "In #{year} years you will be:"
  puts "#{final_age}"
end

get_age(age, year)

#tells them how old they will be in 10, 20, 30 and 40
def print_age_list(age)
  years_array = [10, 20, 30, 40]

  for i in years_array
    final_age = age + i
    puts "when your age is: #{age}"
    puts "In #{i} years you will be:"
    puts "#{final_age}"
  end
end

print_age_list(20)