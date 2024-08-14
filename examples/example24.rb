require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the split_by_pattern method
begin
  result = obj.split_by_pattern
  puts "Result of split_by_pattern: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
