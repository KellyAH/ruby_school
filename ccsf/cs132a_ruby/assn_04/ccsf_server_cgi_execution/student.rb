class Student

  # track # of the number of student instances
  @@count = 0

  # return total number of students - class method
  def self.total_population
    puts "total student population is: #{@@count}"
  end

  # create setters and getters for attributes
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :home_directory, :login_shell, :mangled_gcos, :number

  def initialize(user_data_array_of_hashes)
    @@count += 1      # Increment the @@count each time a new Student instance is created

    # student attributes
    @number = @@count
    @user_name = user_data_array_of_hashes["user_name"]
    @password = user_data_array_of_hashes["password"]
    @uid = user_data_array_of_hashes["uid"]
    @gid = user_data_array_of_hashes["gid"]
    @gcos_field = user_data_array_of_hashes["gcos_field"]
    @home_directory = user_data_array_of_hashes["home_directory"]
    @login_shell = user_data_array_of_hashes["login_shell"]
    @mangled_gcos = nil
  end

  # put student object instacne variables into an array
  def self.student_variable_names(student_object)
    student_object.instance_variables.map {|key| key.slice(1,key.length).to_s}
  end

  # put student_values into an array
  def put_student_values_in_array
    instance_variables.map do |attribute|
      instance_variable_get(attribute)
    end
  end

  # modify gcos value
  def mangled_gcos(gcos_field_data)
    gcos = gcos_field_data.to_s
    @mangled_gcos = nil

    if gcos.include?(" ")
      # clean up gcos data
      @mangled_gcos = gcos.split(/\s|,/).collect {|word| word.capitalize.gsub("-"," ")}.join(" ")
    else
      # invoke mangled_gcos() singleton
      @mangled_gcos = Student.alternate_char_case(gcos_field_data)
    end
    @mangled_gcos
  end

  # singleton/CLASS METHOD - alternate letter case
  def self.alternate_char_case(string)
    characters = string.split(//).map.with_index do |char, index|
      index.odd? ? char.downcase : char.upcase
    end
    characters.join
  end

end

