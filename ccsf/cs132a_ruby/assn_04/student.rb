class Student

  @@count = 0

  attr_accessor :user_name, :password
#attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell

  def initialize(user_name, password)
  #def initialize(user_name, password, uid, gid, gcos_field, directory, shell)
    @user_name = user_name
    @password = password
    # @uid = uid
    # @gid = gid
    # @gcos_field = gcos_field
    # @directory = directory
    # @shell = shell
    @@count += 1
  end

  def self.class_count
    @@count
  end

  def Student.cleanup_gcos(Gcos)
    # if 2 word = print word
    # if single word = swap cahr case
    # # multi data
    # else clean up
  end

  def display_data
  #build table
end

#get data from server
raw_data = "ahall1	xxx"
cleaned_up = raw_data.split(' ')
#print cleaned_up

#build hash w/ arrays to store data via iterate thru data from server
students_hash = cleaned_up.to_h

puts students_hash

{[john, xxx],[joe, xxx]}

# iterate thru hash, pass to students class - counter

#students.each { |student| Student.new()}

#bob = Student.new("bob", "123", "111", "bgidlahblah", "bobb", "directory1", "shellx")
bob.cleanup_gcos(Gcos)
#sally = Student.new("sally", "321", "222", "gidblah", "ssally", "directory2", "shelly")
sally.cleanup_gcos(Gcos)
  joe.cleanup_gcos(Gcos)
  don.cleanup_gcos(Gcos)

  hash_data .each {|person| person.cleanup_gcos(Gcos)}

#john = Student.new("sally", "321", "222", "gidblah", "ssally", "directory2", "shelly")
#john.class_count

#puts Student.class_count
