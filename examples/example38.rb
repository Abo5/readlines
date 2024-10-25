require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the decrypt_content method
begin
  result = obj.decrypt_content
  puts "Result of decrypt_content: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
