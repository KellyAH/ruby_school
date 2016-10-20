class CcsfServer

  attr_reader :user_accounts

  #turn array returned from ruby_class_user_accounts into hash to be fed into Student class
  def student_data_hash

    # turn data into 2 Dim array containing arrays of eles where delimiter is colon :
    clean_user_account_data = ruby_class_user_accounts.map { |x| x.split(/:/) }

    # turn data into a hash using 2 arrays for keys and values
    keys = %w[user_name password uid gid gcos_field home_directory login_shell]
    final_array_of_hashes = []

    clean_user_account_data.each do |account_data|
      hash = Hash.new
      keys.each_with_index { |item, index| hash[item] = account_data[index] }
      final_array_of_hashes << hash
    end
    final_array_of_hashes
  end

  #return array of only user account data for ruby class personnel
  def ruby_class_user_accounts

    # use splat on an array to deconstruct it so it can be fed into start_with? method
    user_account_data = all_accounts.find_all { |lines| lines.start_with?(*ruby_class_personnel) }

    # remove trailing new lines
    user_account_data = user_account_data.map { |x| x.strip }
  end

  #return array of all the members in the ruby class
  def ruby_class_personnel
    # find group in group.txt
    ruby_group = ruby_group_raw_data.find { |line| line.start_with?('c74686')}

    # clean up group.txt file data
     members = ruby_group.split(':').slice(3).strip

    # turn data into array of member names
    members = members.split(',')
  end

  # get group.txt file
  def ruby_group_raw_data
    # when run on server
    # glines = File.readlines('/etc/group')
    File.readlines('data/group.txt')
  end

  # get passwd.txt file
  def all_accounts
    # when run on server
    # lines = File.readlines('/etc/passwd')
    File.readlines('data/passwd.txt')
  end
end
