require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the validate_content method
begin
  result = obj.validate_content
  puts "Result of validate_content: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
