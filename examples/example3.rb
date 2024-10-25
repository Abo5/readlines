require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the word_count method
begin
  result = obj.word_count
  puts "Result of word_count: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
