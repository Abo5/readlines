require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the split_file method
begin
  result = obj.split_file
  puts "Result of split_file: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
