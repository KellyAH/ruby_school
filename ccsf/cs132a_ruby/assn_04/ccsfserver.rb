class CcsfServer

  attr_reader :ruby_class_members, :ruby_student_accounts

  def initialize
    puts "fetching ccsf data..."
    @ruby_class_members = nil
    @ruby_student_accounts = nil
  end

  #return array of all the members in the ruby class
  def ruby_class
    # clean up data
    members = group_data[0].split(':').slice(3).strip
    p members

    # turn data into array of member names
    @ruby_class_members = members.split(',')
  end

  def account_data(ruby_class, student_data)
    @ruby_student_accounts = student_data.find_all { |lines| lines.start_with?("kfreedma", "azaytsev", "eblock4", "kfeng4", "khong5", "ndosquec", "rchen14", "sli325", "ahall1", "kkovalch") }
  end

  def student_data
    # fetch on server via: cat /etc/passwd # gets ALL STUDENT DATA

    ## COMMENT OUT WHEN CODE IS ON SERVER
    lines = File.readlines('data/passwd.txt')

    ## REMOVE COMMENT WHEN CODE IS ON SERVER
    #lines = File.readlines(’/etc/passwd’)
    lines
  end


  private

  def group_data
    # fetch on server via: cat /etc/group | grep c74686
    glines = File.readlines('data/group.txt')

    ## REMOVE COMMENT WHEN CODE IS ON SERVER
    #glines = File.readlines('/etc/group')
    glines
  end



end
