require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the convert_encoding method
begin
  result = obj.convert_encoding
  puts "Result of convert_encoding: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
