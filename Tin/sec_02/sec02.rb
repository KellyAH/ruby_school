# prints the appropriate salutation to the screen
def bookends(type)
  puts "*" * 30

  case type
    when "start"
      puts "[[WELCOME TO MY PROGRAM...]]"
    when "end"
      puts "[[THANK YOU FOR PARTICIPATING. SEE YOU NEXT TIME.]]"
    else
      puts "[[PROCESSING... PLEASE WAIT...]]"
  end

  puts "*" * 30
end

@answers = []

# asks the user to input an value and saves it
def fetch_user_data(array)

  array.each do |item|
    puts "Please enter a #{item}:"
    answer = gets.chomp
    @answers << answer
    puts "#{item.capitalize}: #{answer}"
  end

end

def sentence_maker(array)
  print "The"
  array.each {|word| print " #{word}"}
  print "."
  puts
end

#say greeting
bookends("start")
puts "PLEASE ANSWER THE FOLLOWING QUESTIONS:"

#get data from user
questions = ["occupation", "verb ending in ‘ed’", "adjective", "body part"]
fetch_user_data(questions)

# make sentence
puts "All those words combined into a sentence looks like:"
sentence_maker(@answers)

#say goodbye
bookends("end")