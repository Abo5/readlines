require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the reverse_content method
begin
  result = obj.reverse_content
  puts "Result of reverse_content: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
