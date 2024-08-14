require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the character_count method
begin
  result = obj.character_count
  puts "Result of character_count: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
