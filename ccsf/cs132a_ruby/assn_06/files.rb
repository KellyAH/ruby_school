require 'fileutils'

@path = ARGV      # capture arguments passed to ruby script

# indent directories based on level
def indent_directories(level)
  "-" * level
end

# # get directory name from path
# def directory_name(path)
#   path[0].to_s.split("/").last
# end


# get directory contents & remove any entries that start with .
def directory_contents(path)

  # turn path array into string
  path = path[0].to_s

  # get directory contents from path
  directory_contents = Dir.entries(path)

  clean_directory_contents = []

   directory_contents.each do |item|
     # remove any entries that start with .
     clean_directory_contents << item unless item.start_with?('.')
   end
  clean_directory_contents
end


def print_out_directory_contents(path)
  # get directory contents & remove unwanted entries
  entries = directory_contents(path)

  path = @path[0].to_s

  # print out files & directorys
  entries.each do |item|
    full_path_file = "#{path}/#{item}"
    case File.ftype(full_path_file)
      when "file"
        creation_date =  File.mtime(full_path_file)
        size = File.size(full_path_file)
        puts "#{item} - #{size} - #{creation_date}"
      when "directory"
        puts "--| " + "#{item}"
    end
  end

end


print_out_directory_contents(@path)

