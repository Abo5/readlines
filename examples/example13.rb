require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the replace_csv_value method
begin
  result = obj.replace_csv_value
  puts "Result of replace_csv_value: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
