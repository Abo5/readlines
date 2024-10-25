require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the read_lines method
begin
  result = obj.read_lines
  puts "Result of read_lines: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
