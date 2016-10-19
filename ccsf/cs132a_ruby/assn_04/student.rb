class Student

  # track # of the number of student instances
  @@count = 0

  # return total number of students - class method
  def self.total_population
    puts "total student population is: #{@@count}"
  end

  # create setters and getters for attributes
  attr_reader :ruby_classroom_user_accounts
  #attr_reader :count    # read count value outside of class
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell, :mangled_gcos, :number

  def initialize(user_data_array_of_hashes)

    @user_name = user_data_array_of_hashes["user_name"]
    @password = user_data_array_of_hashes["password"]
    @uid = user_data_array_of_hashes["uid"]
    @gid = user_data_array_of_hashes["gid"]
    @gcos_field = user_data_array_of_hashes["gcos_field"]
    @directory = user_data_array_of_hashes["giddirectory"]
    @shell = user_data_array_of_hashes["gidshell"]

    @@count += 1      # Increment the @@count each time a new Student instance is created

    @mangled_gcos = nil
    @number = @@count

    @ruby_classroom_user_accounts
  end

  # return array of all data for a student object
  def self.student_full_data(student_object, keys)
    student_full_data = []
    #FAILS##student_full_data << student_object.instance_variable_get(*keys)
    # student_full_data << student_object.instance_variable_get(*keys)
    # student_full_data << student_object.instance_variable_get("@number")
    # student_full_data << student_object.instance_variable_get("@user_name")
    keys.map {|v| student_object.send(v.to_sym) }
  end

  # Create singleton methods for each Student instance: it will be named mangled_gcos
  def mangled_gcos(gcos_field_data)
    gcos = gcos_field_data.to_s
    @mangled_gcos = nil

    # If the student’s gcos_field contains a space
    if gcos.include?(" ")
      # capitalize all of the words in the gcos_field data.
      # split string into array & capitalize each word, join together into a string
      @mangled_gcos = gcos.split(/\s/).collect {|word| word.capitalize}.join(" ")
      # If the student’s gcos_field contains a comma
    elsif gcos.include?(',')
      gcos_field_data.gsub(/,/," ").gsub(/-/," ")
      # If the gcos_field does not contain any spaces
    else
      # invoke mangled_gcos() singleton
      @mangled_gcos = Student.alternate_char_case(gcos_field_data)
    end

    @mangled_gcos
  end

  # mangled_gcos() singleton/CLASS METHOD will alternate the case of each letter of the gcos_field data.
  def self.alternate_char_case(string)
    characters = string.split(//)
    characters = characters.map.with_index do |char, index|
      index.odd? ? char.upcase : char.downcase
    end
    characters.join
  end

end

