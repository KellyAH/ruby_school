
class SolvePuzzle

  attr_reader :phrase_to_solve
  attr_accessor :final_sentence

  def initialize(phrase_to_solve)
    @phrase_to_solve = phrase_to_solve
    @sentence_array = @phrase_to_solve.split(//).map(&:downcase)
    @accurate_count = @sentence_array - [' ']
    @final_sentence = @phrase_to_solve.gsub(/[a-zA-Z]/, '_').split('')
    @special_count = @phrase_to_solve.count "^a-zA-Z\s"
  end

  def check_user_input(user_input)

    if @sentence_array.include? user_input
      puts "That is a right guess"
      letter_index = @sentence_array.each_index.select { |i| @sentence_array[i] == user_input }
      letter_index.each { |index| @sentence_array[index] = '' }
      letter_index.each { |index| @final_sentence[index] = user_input }
      puts "The sentence is now: #{@final_sentence.join}"
      #true
    end
    @sentence_array.count('') < (@accurate_count.count - @special_count) ? true : 'phrase solved'
  end
end
