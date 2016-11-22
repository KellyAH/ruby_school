class Legs

  attr_accessor :number_of_legs, :material

  def initialize
    @number_of_legs
    @material
  end

end

class Table < Legs

  def initialize
    @number_of_legs = 40
    @material = "wood"

    puts "a table was created with #{@number_of_legs} legs and made of #{@material}"
  end

end

class Chair < Legs

  def initialize
    @number_of_legs = 4
  end

  def self.get_user_height
    puts "what is your height in inches?"
    user_height = gets.chomp
    puts "you are #{user_height} inches tall"
    user_height.to_i
  end

  def self.get_requested_material
    puts "what do you want the chair to be made of?"
    material = gets.chomp
    puts "you choose #{material}"
    material.to_s
  end

  def create_chair
    @material = Chair.get_requested_material
    @leg_height = Chair.get_user_height
    @back_height = "low"

    puts "a chair was created with #{@number_of_legs} legs #{@leg_height} inches tall, made of #{@material}, with a #{@back_height} back height."
    return self
  end

  # def back_height
  #   @back_height =  low, mid, or tall/executive
  # end

def method_missing
  
end

desk = Table.new
p desk

# leg_height = Chair.get_user_height
# material = Chair.get_requested_material

chair_base = Chair.new
# throne = chair_base.create_chair
# p throne


chair_base.something("apple",8)
