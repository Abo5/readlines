require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the split_file_by_size method
begin
  result = obj.split_file_by_size
  puts "Result of split_file_by_size: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
