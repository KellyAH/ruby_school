require_relative 'datagrabber'
require_relative 'tinstudent'

student_data = DataGrabber.new
clean_data = student_data.file_data('data/students.txt')
students = student_data.clean_up_data_array(clean_data)

p students


