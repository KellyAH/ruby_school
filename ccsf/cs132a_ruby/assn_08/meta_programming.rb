# base class
class Legs
  attr_accessor :number_of_legs, :material

  def initialize
    @number_of_legs = 2
  end
end


# a child of base class Legs
class Toy < Legs

  def initialize(brand)
    @brand_name = brand
  end

# auto generate methods at run time
  common_animals = %w[octopus catapillar kangaroo]

  common_animals.each do |animal|
    define_method("#{animal}_details") do |*args|

      p "creating: Toy #{animal}"
      p "material: #{args[0]}"
      p "number_of_legs: #{args[2]}"
      p "height: #{args[1]} inches"
      p "-" * 10
    end
  end

  # auto generate objects if method if it is not found in child nor parent classes
  def method_missing(method_name, *args)
    self.instance_eval "def #{method_name}(*args)
      puts 'Creating #{method_name} method...'
      puts 'instansiating class...'
      new_toy = Toy.new(*args)
      end"
    self.send method_name, args
  end

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

  # auto generate method if it is not found in child nor parent classes
  def method_missing(method_name, *args)
    self.instance_eval "def #{method_name}(*args)
      puts 'Creating #{method_name} method...'
      p 'made of material: #{args[0]}'
      p 'height in inches: #{args[1]}'
      end"
    self.send method_name, args
  end

end


puts "-" * 30
puts "DISPLAY LOGIC FOR DETERMINING BACK HEIGHT"
puts "-" * 30
chair_base = Chair.new
throne = chair_base.create_chair("gold", 10)
p throne

chair = chair_base.create_chair("wood", 50)
p chair

large_chair = chair_base.create_chair("stone", 88)
p large_chair

puts "-" * 30
puts "USE MISSING_METHOD METHOD AND instance_eval TO AUTO GENERATE METHOD IF IT IS NOT FOUND IN CLASSES"
puts "-" * 30
chair_base.create_santa_chair("red wool", 88)
chair_base.create_iron_throne("swords of my fallen enemies", 100)


puts "-" * 30
puts "USE DEFINE_METHOD METHOD TO AUTO GENERATE METHODS AT RUN TIME"
puts "-" * 30

puts "create base toy"
toy = Toy.new("mattel")
p toy

puts "-" * 10
toy.octopus_details("pine", 33, 8)
toy.kangaroo_details("iron", 88, 2)
toy.catapillar_details("plastic", 33, 16)

puts "-" * 10
puts "create another toy object via instance_eval"
unbranded_toy = toy.create_unbranded_toy("Not Branded")
p unbranded_toy
