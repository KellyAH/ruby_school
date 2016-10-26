require_relative 'datagrabber'
require_relative 'tinstudent'

file_fetcher = DataGrabber.new
file_data = file_fetcher.file_data('data/students.txt')

#p file_data


header = file_fetcher.header(file_data)
#p header


students = file_fetcher.non_header_rows(file_data)
#p students

student_hash = file_fetcher.turn_array_into_hash(header, students)
#p student_hash

students = []
student_hash.map {|student_hash| students << Tinstudent.new(student_hash)}

#p students

file_header = %w[student average_score]
p file_header

student_names =  students.map {|student| student.full_name}

student_avg_scores =  students.map {|student| student.avg_test_score}

file_data = student_names + student_avg_scores
p file_data

student_file_data = file_fetcher.turn_array_into_hash(file_header, file_data)
p student_file_data
