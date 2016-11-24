# require './wheel_of_fortune.rb'
require './wheel.rb'
class Player

  attr_reader :player_name
  attr_accessor :account_balance, :current_player

  def initialize(player_name)
    @player_name = player_name
    @account_balance = 500
  end

  def self.swap_player(current_player)
    puts "swap players"
  end

  def self.start_game(player_array)
    @current_player = player_array.sample
    Wheel.new(@current_player.player_name)
  end

end



