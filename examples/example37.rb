require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the encrypt_content method
begin
  result = obj.encrypt_content
  puts "Result of encrypt_content: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
