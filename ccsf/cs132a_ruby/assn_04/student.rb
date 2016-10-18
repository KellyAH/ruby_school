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
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell

  def initialize(*userdata)
  #def initialize(user_name, password, uid, gid, gcos_field, directory, shell)
    @user_name = user_name
    @password = password
    @uid = uid
    @gid = gid
    @gcos_field = gcos_field
    @directory = directory
    @shell = shell

    @@count += 1      # Increment the @@count each time a new Student instance is created

    @mangled_gcos = nil

    @ruby_classroom_user_accounts
  end

  #get student data for ruby class
  def student_data
    # initizlize CcsfServer class
    ccsf_data = CcsfServer.new

    # save user_accounts instance var to new var
    user_accounts = ccsf_data.user_accounts

    # turn data into array of eles where delimiter is colon :
    clean_user_account_data = user_accounts.map { |x| x.split(/:/) }

    # turn data into a hash using 2 arrays for keys and values
    keys = %w[user_name password uid gid gcos_field home_directory login_shell]

    final_array_of_hashes = []

    clean_user_account_data.each do |account_data|
      hash = Hash.new
      keys.each_with_index { |item, index| hash[item] = account_data[index] }
      final_array_of_hashes << hash
    end

    # ruby class user accounts
    @ruby_classroom_user_accounts = final_array_of_hashes
  end

  # mangled_gcos() singleton/CLASS METHOD will alternate the case of each letter of the gcos_field data.
  def self.mangled_gcos(string)
    characters = string.split(//)
    characters = characters.map.with_index do |char, index|
      index.odd? ? char.upcase : char.downcase
    end
    characters.join
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
      @mangled_gcos = Student.mangled_gcos(gcos_field_data)
    end

    @mangled_gcos
  end
end

