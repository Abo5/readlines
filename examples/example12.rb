require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the replace_multiple_patterns method
begin
  result = obj.replace_multiple_patterns
  puts "Result of replace_multiple_patterns: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
