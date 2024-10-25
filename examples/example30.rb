require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the file_size method
begin
  result = obj.file_size
  puts "Result of file_size: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
