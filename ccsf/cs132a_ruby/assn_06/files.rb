# Name: Kelly Hong
# Date: Tuesday, November 8, 2016
# File: files.rb
# Desc: write a script that prints a directory listing. list the file names recursively; that is to say, show the names of all the files in all of the subdirectories inside the target directory provided by the user (files in a subdirectory should be indented under that directory name.
# Assigment: https://ccsf.instructure.com/courses/2612/assignments/25216#submit

require 'fileutils'

@path = ARGV[0].to_s      # capture arguments passed to ruby script and turn path array into string

# indent directories based on level
def indent_directory(level)
  "--| " * level
end

# get directory contents & remove any entries that start with .
def directory_contents(path)

  # get directory contents from path
  directory_contents = Dir.entries(path)

  clean_directory_contents = []

   directory_contents.each do |item|
     # remove any entries that start with .
     clean_directory_contents << item unless item.start_with?('.')
   end
  clean_directory_contents
end


def print_out_directory_contents(path, depth = 0)

  # get directory name from path
  directory = path.split("/").last

  # track how deep you are in directories
  new_depth = depth + 1

  # print out directory fed as argument
  puts indent_directory(new_depth) + "#{directory}"

  # get directory contents & remove unwanted entries
  entries = directory_contents(path)

  # print out files & sub directory contents
  entries.each do |item|
    full_path_file = "#{path}/#{item}"
    case File.ftype(full_path_file)
      when "directory"
        print_out_directory_contents(full_path_file, new_depth)
      when "file"
        creation_date =  File.mtime(full_path_file)
        size = File.size(full_path_file)
        puts indent_directory(new_depth) + "Filename: #{item} - Fize: #{size} - Created On: #{creation_date}"
      else
      # do nothing
    end
  end
end

print_out_directory_contents(@path)
