require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the search_logical_patterns method
begin
  result = obj.search_logical_patterns
  puts "Result of search_logical_patterns: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
