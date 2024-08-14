require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the line_count method
begin
  result = obj.line_count
  puts "Result of line_count: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
