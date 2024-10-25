require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the delete_right_left_separator method
begin
  result = obj.delete_right_left_separator
  puts "Result of delete_right_left_separator: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
