class CcsfServer

  attr_reader :user_accounts

  def initialize
    puts "initializing class CcsfServer..."
    ruby_group_raw_data
    all_accounts
    ruby_class_personnel
    @user_accounts = ruby_class_user_accounts
    puts "QQQQQ :  @user_accounts in initialize is: #{@user_accounts}"
  end


  # return array of only user account data for ruby class personnel
  def ruby_class_user_accounts

    # use splat on an array to deconstruct it so it can be fed into start_with? method
    user_account_data = all_accounts.find_all { |lines| lines.start_with?(*ruby_class_personnel) }

    # remove trailing new lines
    clean_users = user_account_data.map { |x| x.strip }
  end

  #return array of all the members in the ruby class
  def ruby_class_personnel
    # clean up data
    members = ruby_group_raw_data[0].split(':').slice(3).strip

    # turn data into array of member names
    ruby_class_members = members.split(',')
  end

  def ruby_group_raw_data
    # fetch on server via: cat /etc/group | grep c74686
    glines = File.readlines('data/group.txt')

    ## REMOVE COMMENT WHEN CODE IS ON SERVER
    #glines = File.readlines('/etc/group')
    glines
  end

  def all_accounts
    # fetch on server via: cat /etc/passwd # gets ALL STUDENT DATA

    ## COMMENT OUT WHEN CODE IS ON SERVER
    lines = File.readlines('data/passwd.txt')

    ## REMOVE COMMENT WHEN CODE IS ON SERVER
    #lines = File.readlines(’/etc/passwd’)
    lines
  end
end
