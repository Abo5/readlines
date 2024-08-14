require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the convert_to_array method
begin
  result = obj.convert_to_array
  puts "Result of convert_to_array: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
