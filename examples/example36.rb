require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the check_spelling method
begin
  result = obj.check_spelling
  puts "Result of check_spelling: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
