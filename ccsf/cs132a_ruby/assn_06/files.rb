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

# # without recursive
# def print_out_directory_contents(path)
#   # get directory contents & remove unwanted entries
#   entries = directory_contents(path)
#
#   path = @path[0].to_s
#
#   # print out files & directorys
#   entries.each do |item|
#     full_path_file = "#{path}/#{item}"
#     case File.ftype(full_path_file)
#       when "file"
#         creation_date =  File.mtime(full_path_file)
#         size = File.size(full_path_file)
#         puts "#{item} - #{size} - #{creation_date}"
#       when "directory"
#         puts "--| " + "#{item}"
#     end
#   end
# end


# with recursion
def print_out_directory_contents(path)

  # get directory name from path
  directory = path.split("/").last

  # ToDo fix this- it indents on every sub dir in a single dir
  # track how deep you are in directories
  @depth ||= 0
  @depth += 1     #increment depth

  # print out directory fed as argument
  puts indent_directory(@depth) + "#{directory}"

  # get directory contents & remove unwanted entries
  entries = directory_contents(path)

  # print out files & sub directory contents
  entries.each do |item|
    full_path_file = "#{path}/#{item}"
    case File.ftype(full_path_file)
      when "directory"
        print_out_directory_contents(full_path_file)
      when "file"
        creation_date =  File.mtime(full_path_file)
        size = File.size(full_path_file)
        puts indent_directory(@depth) + "Filename: #{item} - Fize: #{size} - Created On: #{creation_date}"
      else
      # do nothing
    end
  end
end

print_out_directory_contents(@path)
