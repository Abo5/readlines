require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the sort_alphabetically method
begin
  result = obj.sort_alphabetically
  puts "Result of sort_alphabetically: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
