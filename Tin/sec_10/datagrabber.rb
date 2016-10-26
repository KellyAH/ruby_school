class DataGrabber
# Responsabilities: get file data, clean up file data
# Collaborators:  class tinstudent

  def initialize

  end


  # returns array of file contents
  def file_data(file)
    data = File.readlines(file)
    data.map {|x| x.strip}
  end

  # returns 2 dimensional array of all data, sans header
  def non_header_rows(data)
    values = data.pop(data.length - 1)
    values.map! {|x| x.split(',')}
    values.map {|x| x.map {|i| i.strip} }
  end

  # returns 1st row of data as array
  def header(data)
    header = data[0].split(',')
    header.map { |item| item.strip }
  end

  def turn_array_into_hash(keys, values)
    final_hash = []

    values.each do |x|

      hash = Hash.new

      keys.each_with_index { |item, index|
        hash[item] = x[index]
      }
      final_hash << hash

    end

    final_hash

  end

end
