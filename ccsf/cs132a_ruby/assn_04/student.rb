class Student

  # count of the number of student instances (REQUIRED ELE)
  @@count = 0

  # return total number of students
  def self.total_population
    @@count
  end

  # Add one addtional empty attribute to the Student class: mangled_gcos. The value for this attribute will be set later, so do not set it in the class.
  @mangled_gcos = nil

  # create setters and getters for attributes
  #attr_reader :count    # read count value outside of class
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell

  def initialize(user_name, password, uid, gid, gcos_field, directory, shell)
  #def initialize(user_name, password, uid, gid, gcos_field, directory, shell)
    @user_name = user_name
    @password = password
    @uid = uid
    @gid = gid
    @gcos_field = gcos_field
    @directory = directory
    @shell = shell

    # Increment the @@count each time a new Student instance is created
    @@count += 1
  end

  # mangled_gcos() singleton/CLASS METHOD will alternate the case of each letter of the gcos_field data.
  def self.mangled_gcos(string)
    characters = string.split(//)
    characters = characters.map.with_index do |char, index|
      index.odd? ? char.upcase : char.downcase
    end
    characters.join
  end

  def display_data
    #build table
  end




  # Create singleton methods for each Student instance: it will be named mangled_gcos.
  #
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
      @mangled_gcos = Student.mangled_gcos(gcos_field_data)
    end

    @mangled_gcos
  end
end




#get data from server
#raw_data = "ahall1	xxx"
#cleaned_up = raw_data.split(' ')
#print cleaned_up

#build hash w/ arrays to store data via iterate thru data from server
#students_hash = cleaned_up.to_h

#puts students_hash

#{[john, xxx],[joe, xxx]}

# iterate thru hash, pass to students class - counter

#students.each { |student| Student.new()}

#bob = Student.new("bob", "123", "111", "bgidlahblah", "bobb", "directory1", "shellx")
#bob.cleanup_gcos(Gcos)
#sally = Student.new("sally", "321", "222", "gidblah", "ssally", "directory2", "shelly")
#sally.cleanup_gcos(Gcos)
 # joe.cleanup_gcos(Gcos)
  #don.cleanup_gcos(Gcos)

  #hash_data .each {|person| person.cleanup_gcos(Gcos)}

#john = Student.new("sally", "321", "222", "gidblah", "ssally", "directory2", "shelly")
#john.class_count

#puts Student.class_count
