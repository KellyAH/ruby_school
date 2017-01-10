module Miscellaneous

  # converts a Fahrenheit temperature to Celcius.
  def f_to_c(temperature)
    celcius = (temperature.to_f - 32) * 5/9
    "A temperature of #{temperature}F is equal to #{celcius}C"
  end

  # converts a Celcius temperature to Fahrenheit.
  def c_to_f(temperature)
    fahrenheit = (temperature.to_f * 9/5) + 32
    "A temperature of #{temperature}C is equal to #{fahrenheit}F"
  end

  # returns the current date in the format mm/dd/yyyy.
  def current_date
    today = Time.now
    today.strftime("%m/%d/%Y")
  end

end


class Diary
  # Use the Miscellaneous module as a mixin in the Diary class.
  include Miscellaneous
end


my_book = Diary.new   # instantiate Diary class to create object

# Print the current date using the current_date method.
puts "today's date is: #{my_book.current_date}"

# Print the temperature of 72F as Celcius using the f_to_c method.
puts my_book.f_to_c(72)

# Print the temperature 30C as Fahrenheit using the c_to_f method.
puts my_book.c_to_f(30)
