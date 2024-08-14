require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the search_in_range method
begin
  result = obj.search_in_range
  puts "Result of search_in_range: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
