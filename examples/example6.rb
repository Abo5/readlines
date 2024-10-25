require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the search_about method
begin
  result = obj.search_about
  puts "Result of search_about: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
