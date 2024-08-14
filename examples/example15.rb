require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the delete_unwanted_characters method
begin
  result = obj.delete_unwanted_characters
  puts "Result of delete_unwanted_characters: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
