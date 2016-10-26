class DataGrabber

  # returns away of file contents
  def file_data(file)
    File.readlines(file)
  end

  def clean_up_data_array(array)
    array.map {|x| x.strip}
  end

end
