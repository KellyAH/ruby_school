class Player

  @@number_of_players = 0

  def number_of_students
    @@number_of_players += 1
  end

  def initialize(name, balance = 0)
    @name = name
    @balance = balance
  end

  def list_player
    puts clothes
    puts "name is: #{@name}"
  end

  def self.list_player
    puts "blahhhh"
  end

  def self.get_player_name
    puts "what is your name?"
    gets.chomp
  end

  def self.make_players(number, player_name_one, player_name_two)
    player_one = Player.new(player_name_one)
    player_two = Player.new(player_name_two)
    return player_one, player_two
  end

end
