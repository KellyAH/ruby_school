require_relative 'datagrabber'

#students = Tinstudent.new

student_data = DataGrabber.new
clean_data = student_data.file_data('students.txt')
p student_data.clean_up_data_array(clean_data)



