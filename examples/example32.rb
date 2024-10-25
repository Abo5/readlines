require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the pattern_exists? method
begin
  result = obj.pattern_exists?
  puts "Result of pattern_exists?: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
