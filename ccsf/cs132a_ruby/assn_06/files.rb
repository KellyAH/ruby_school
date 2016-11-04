require 'fileutils'

# capture arguments passed to ruby script
@path = ARGV

# indent directories based on level
def indent_directories(level)
  "-" * level
end

# get directory name from path
def directory_name(path)
  path[0].to_s.split("/").last
end


def directory_contents(path)

  # turn path array into string
  dir_path = path[0].to_s

  # get directory contents from path
  directory_contents = Dir.entries(dir_path)
  #p directory_contents

  # remove unwanted directories from directory_contents
  # directory_contents.delete('.')
  # directory_contents.delete('..')
  # directory_contents.delete('.DS_Store')
  # directory_contents.delete('.localized')

  clean_directory_contents = []

   directory_contents.each do |item|
     #puts item
     #puts "DELETE ME: #{item}" if item.start_with?('.')
     clean_directory_contents << item unless item.start_with?('.')
   end
  clean_directory_contents
end

# return only files and directories from dir contents
def file_and_directory_tree(dir_contents)
  path = @path[0].to_s

  # detects files & directories and outputs their data
  dir_contents.each do |item|
    full_path_file = "#{path}/#{item}"
    case File.ftype(full_path_file)
      when "file"
        creation_date =  File.mtime(full_path_file)
        size = File.size(full_path_file)
        puts "#{item} - #{size} - #{creation_date} "
      when "directory"
        puts "-->" + "#{item}"
      else
        # do nothing
    end
  end
end

entries = directory_contents(@path)
 #puts entries
file_and_directory_tree(entries)

