require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = ReadDuc.new(file_path)

# Example usage of the search_multiple_patterns method
begin
  result = obj.search_multiple_patterns
  puts "Result of search_multiple_patterns: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
