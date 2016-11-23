# base class
class Legs
  attr_accessor :number_of_legs, :material
end

# child of base class Legs
class Table < Legs

  def initialize
    @number_of_legs = 4
    @material = "wood"
  end

  def create_table(number_of_legs, material)
    @number_of_legs = number_of_legs
    @material = material
    "a table was created with #{@number_of_legs} legs and made of #{@material}"
  end

end

# # another child of base class Legs
class Toy
#
#   def initialize
#     @material = "wood"
#   end
#
#   # #list of common animals & # of legs
#   # animal_legs = {}
#   # animal_legs[:cat] = 4
#   # animal_legs[:catapiller] = 16
#   # animal_legs[:octopus] = 8
#
# auto generate methods at run time
common_animals = %w[rabbit catapillar kangaroo]

common_animals.each do |animal|
  define_method("#{animal}_details") do |*args|

    puts "creating: #{animal}"
    puts "material: #{args[0]}"
    puts "height: #{args[1]} inches"
  end
end


#   def create_animal_toy(type, name, number_of_legs, material)
#     animal_name = type
#     @number_of_legs = number_of_legs
#     @material = material
#
#     puts "a toy #{animal_name} was created and it's name is #{name}. It has #{@number_of_legs} legs and is made of #{@material}."
#   end
end

# another child of base class Legs
class Chair < Legs

  def initialize
    @number_of_legs = 4
  end

  # create a chair
  def create_chair(material, leg_height_inches)
    @material = material
    @leg_height_inches = leg_height_inches
    @back_height = Chair.calculate_back_height(leg_height_inches)

    "a chair was created with #{@number_of_legs} legs #{@leg_height_inches} inches tall, made of #{@material}, with a #{@back_height} back height."
  end

  # determine height of back of chair based on user's height
  def self.calculate_back_height(leg_height_inches)
    if leg_height_inches <= 36
      @back_height =  "low"
    elsif leg_height_inches >= 60
      @back_height =  "high"
    else
      @back_height = "mid"
    end
  end

  #FIX IT
  # def method_missing(method_name, *args)
  #   if method_name.to_s =~ /create_.*/
  #     Chair.send($1, *args)
  #   else
  #     super
  #   end
  # end

  def method_missing(method_name, *args)
    self.instance_eval "def #{method_name}(*args)
      puts 'Creating #{method_name} method with these arguments.'
      args.each {|a| p a.inspect }
      end"
    self.send method_name, args
  end

end





desk = Table.new

chair_base = Chair.new
throne = chair_base.create_chair("gold", 10)
p throne

chair = chair_base.create_chair("wood", 50)
p chair

large_chair = chair_base.create_chair("stone", 88)
p large_chair


# invoke methods that aren't defined in class
# method_missing will be triggered and auto create methods
p chair_base.create_santa_chair("red fur", 88)



toy = Toy.new
p toy.rabbit_details("pine", 33)
p toy.kangaroo_details("iron", 88)
