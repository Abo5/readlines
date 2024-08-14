require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the replace_special_characters method
begin
  result = obj.replace_special_characters
  puts "Result of replace_special_characters: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
