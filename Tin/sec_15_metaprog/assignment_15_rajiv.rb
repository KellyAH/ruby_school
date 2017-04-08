# Part 1
class String
  def to_awesome_string
    self.prepend("awesome ")
  end
end

puts "rubears".to_awesome_string

# Part 2
class Talk
end


class Talk
  def english
    "Speaking in english"
  end

  def spanish
    "Speaking in spanish"
  end
end

t = Talk.new
puts t.english
puts t.spanish

# Part 3
class Variable

  def initialize(attribute_name, attribute_value)
    self.class.send(:attr_accessor, attribute_name.slice(1, attribute_name.length - 1))
    instance_variable_set(attribute_name, attribute_value)
  end

end

v = Variable.new("@name", "Ruby")
puts v.name
v = Variable.new("@last_name", "Rails")
puts v.last_name