class Tinstudent
# Responsabilities: handle the student data
# Collaborators: class DataGrabber

  attr_reader :first_name, :last_name, :average_score

  def initialize(student_data_hash)
    @first_name = student_data_hash["first_name"]
    @last_name = student_data_hash["last_name"]
    @exam1_score = student_data_hash["exam1"]
    @exam2_score = student_data_hash["exam2"]
    @exam3_score = student_data_hash["exam3"]
    @exam4_score = student_data_hash["exam4"]

    @average_score = 0
  end

  def avg_test_score
    test_scores = [@exam1_score, @exam2_score, @exam3_score, @exam4_score]
    test_scores = test_scores.map {|score| score.to_i}
    count =  test_scores.size
    sum = 0
    test_scores.each {|score| sum += score}

    @average_score = sum / count
  end

  def full_name
    @first_name + " " + @last_name
  end

  # def create_data_file(data)
  #   require 'fileutils'
  #
  #   # create dir to store file
  #   File.dirname('~/student_data')
  #
  #   file = File.new("student average scores", "a+")
  #   file << data
  # end

end
