require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the extract_patterns method
begin
  result = obj.extract_patterns
  puts "Result of extract_patterns: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
