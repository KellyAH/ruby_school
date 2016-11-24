class Wheel

  attr_reader :player_name
  attr_accessor :wheel_stopped_at

  def initialize(player_name)
    @player_name = player_name
    spin_the_wheel
  end

  def spin_the_wheel
    @wheel_stopped_at = ['500', '550', '600', '650', '700', '800', '900'].sample
  end

end
