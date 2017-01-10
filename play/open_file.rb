require 'open-uri'
names = ''
uri = open('input.txt') do |f|
  f.each_line do |line|
    names += line.chomp
  end
end
puts names.size