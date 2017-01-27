# create a class Variable that accepts an instance variable name and a value on initialization. The instance of the class Variable should then be able to retrieve the value of the instance variable used.

class Variable
  attr_accessor :name, :last_name

  def initialize(attribute, string)
    eval ("#{attribute} = '#{string}'")
  end
end

v = Variable.new('@name', 'Ruby')
puts v.name
# returns: 'Ruby'

v = Variable.new('@last_name', 'Rails')
puts v.last_name

# returns: 'Rails'
