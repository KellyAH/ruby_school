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

p students.map {|student| student.full_name}

#.map {|student| student.first_name}
#students.avg_test_score(raw_student_data)

#p students.test_scores(raw_student_data)