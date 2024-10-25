require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the merge_files method
begin
  result = obj.merge_files
  puts "Result of merge_files: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
