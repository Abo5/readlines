require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the replace method
begin
  result = obj.replace
  puts "Result of replace: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
