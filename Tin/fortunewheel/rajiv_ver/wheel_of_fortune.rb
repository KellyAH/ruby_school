require './player.rb'
require 'faker'
require "./wheel.rb"
require "./solve_puzzle.rb"

class WheelOfFortune

  attr_reader :phrase_selected, :players
  attr_accessor :current_player

  def initialize
    puts '*' * 50
    puts 'Let us play Wheel of Fortune'
    puts '*' * 50
    select_phrase
    create_players
    starting_player
    @phrase_solved = nil
  end

  def switch_players(player_array, player_name)
    new_player_array = player_array.reject { |player| player.player_name == player_name }
    new_player = new_player_array[0]
  end

  def start_game
    @phrase_solved = false
    until @phrase_solved
      display_options
    end
  end

  def display_options
    puts '*' * 50
    @sp ||= SolvePuzzle.new(phrase_selected)
    puts "#{current_player.player_name}, What would you like to do?. You have 3 options:"
    puts "1. Spin the wheel and pick a consonant"
    puts "2. Buy a vowel"
    puts "3. Solve the phrase: #{@sp.final_sentence.join}."
  end

  def user_input
    user_input = gets.chomp
    process_user_input(user_input)
  end

  private

  def process_wheel_value(wheel_value)
    if wheel_value.casecmp('lose a turn') == 0
      puts "Oops! You lost your turn"
      # puts '*' * 50
      @current_player = switch_players(players, current_player.player_name)
      display_options
    elsif wheel_value.casecmp('bankrupt') == 0
      current_player.account_balance = 0
      puts "Oops! You lost all your money!"
      # puts '*' * 50
      @current_player = switch_players(players, current_player.player_name)
      display_options
    else
      puts "The wheel landed on $#{wheel_value}"
      puts "Please enter a consonant"
      consonant_input = gets.chomp
      @sp ||= SolvePuzzle.new(phrase_selected)
      return_value = @sp.check_user_input(consonant_input)

      if return_value.class == TrueClass
        puts "Please continue..."
        current_player.account_balance += wheel_value.to_i

        display_options
      elsif return_value.class == String
        calculate_winner
      else
        puts "Next player..."
        @current_player = switch_players(players, current_player.player_name)

        display_options
      end
      puts "Account balance: #{current_player.account_balance}"
    end
  end

  def process_user_input(user_input)
    if user_input == '1'
      puts "The user chose to spin the wheel!"
      new_wheel = Wheel.new(current_player.player_name)
      wheel_value = new_wheel.spin_the_wheel
      process_wheel_value(wheel_value)
      display_options
    elsif user_input == '2'
      puts "The user chose to buy a vowel"
      current_player.account_balance -= 250
      puts "Please enter a vowel"
      vowel_input = gets.chomp
      @sp ||= SolvePuzzle.new(phrase_selected)
      return_value = @sp.check_user_input(vowel_input)
      puts "QQQQQ : return_VVVVVVVvalue is: #{return_value}"

      if return_value
        puts "Please continue..."
        # puts '*' * 50
        display_options
      elsif return_value == "phrase solved"
        calculate_winner
      else
        puts "Next player..."
        @current_player = switch_players(players, current_player.player_name)
        # puts '*' * 50
        display_options
      end
    elsif user_input == '3'
      #else
      puts "Please enter the phrase"
      user_input = gets.chomp
      if user_input == phrase_selected.chomp
        puts "you guessed correctly! you WON $2000!"
        current_player.account_balance += 2000
        puts "curr bal: #{current_player.account_balance}"

        # calculate player balances to find winner
        calculate_winner

        # stop looping game play
        @phrase_solved = true
      else
        puts "you guessed wrong. you lose a turn!"
        @current_player = switch_players(players, current_player.player_name)
        # puts '*' * 50
        display_options
      end
    else
      puts "Please input a valid option (1, 2 or 3)."
    end
  end

  def calculate_winner
    balances = []
    balances << @players[0].account_balance.to_i
    balances << @players[1].account_balance.to_i

    #balances = [500,500]
    puts "QQQQQ : balances is: #{balances}"

    #handle if balances are equal
    if balances.all? {|amount| amount == balances[0]}
      puts "The pharse has been solved! Both players have the same amount of $. So both win!"
      puts "#{@players[0].player_name} has $#{@players[0].account_balance.to_i}"
      puts "#{@players[1].player_name} has $#{@players[1].account_balance.to_i}"
    else
    # return greatest balance
    winning_balance = balances.max
    #puts "QQQQQ : winning_balance is: #{winning_balance}"
    index_of_winner = balances.index (winning_balance)
    #puts "QQQQQ : index_of_winner is: #{index_of_winner}"
    index_of_winner
    puts "The pharse has been solved! GAME OVER!"
    puts "#{@players[0].player_name} has $#{@players[0].account_balance.to_i}"
    puts "#{@players[1].player_name} has $#{@players[1].account_balance.to_i}"
    puts "#{@players[index_of_winner].player_name} is the player with the most $ and the WINNER! Congradulations #{@players[index_of_winner].player_name}!"
    end
  end

  # def check_phrase(original_phrase, solved_phrase)
  #   if original_phrase.to_s == solved_phrase.to_s
  #
  #   end
  # end

  def select_phrase
    @phrase_selected = File.readlines('puzzles.txt').sample.chomp
    puts @phrase_selected
  end

  def create_players
    @players = []
    2.times { @players << Player.new(Faker::Name.first_name) }
  end

  def starting_player
    @current_player = players.sample
  end

end

# Welcome message
new_round = WheelOfFortune.new
# Announce the 2 players
puts "The 2 players who are going to play today are: #{new_round.players[0].player_name} and #{new_round.players[1].player_name}"
# Announce a random player to start
puts "We have randomly chosen #{new_round.current_player.player_name} to start the game"
# Announce the options available
new_round.display_options
@phrase_solved = false

until @phrase_solved
  @phrase_solved = new_round.user_input
end


