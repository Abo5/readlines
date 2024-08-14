require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the info method
begin
  result = obj.info
  puts "Result of info: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
