#what number am i thinking
#auto gen secret #:  4 digit # - unique 0-9,
## 0431

# store auto generated set of 4 unique numbers.
auto_generated_num = []

while auto_generated_num.size < 4

  item = Random.new.rand(0..9)
  # check if array already includes the same interger you are pushing into it
  auto_generated_num << item unless auto_generated_num.include?(item)

end

# print out auto generated set of 4 unique numbers
p auto_generated_num


# end prog if user exceeds 7 guesses.
# end prog if user gets 4 "bulls" / user wins 4 times.

#score keepers
user_tries = 0
bulls_count = 0
cow_count = 0
winner_numbers = []


while bulls_count < 4 && user_tries < 7

  # ask user for input: for # in right position
  ## E.g. "number 3 is 2nd position" [index 1]
  puts "please enter a number between 0 - 9 and position between 1 - 4 (E.g. '9 2')"

  # cut off traililng new line
  # turn user input into array
  user_num, user_position = gets.chomp.split

  # exit out of blocks and return to while if user input a number they previously entered.
  redo if winner_numbers.include?(user_num.to_i)

  # if both number & position are correct, return "bull"
  if auto_generated_num[user_position.to_i - 1] == user_num.to_i
    puts "bull - you won!"
    puts "Total bulls/wins: #{bulls_count += 1}"

    # save user number input into array
    winner_numbers << user_num.to_i

    # if num = true, position = false, return "cow"
    # see if number existins in array
  elsif auto_generated_num.include?(user_num.to_i)
    puts "cow - you lost!"
    puts "Total cows/losses: #{cow_count += 1}"

    # if num = false, position = true, return "try again"
  else
    puts "You position and number that doesn't exist. Please try again"
  end

  #counter
  puts "Total Tries: #{user_tries += 1}"

end









