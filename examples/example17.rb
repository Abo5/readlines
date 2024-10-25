require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the delete_duplicate_lines method
begin
  result = obj.delete_duplicate_lines
  puts "Result of delete_duplicate_lines: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
