require 'readlines'

# Create an instance of the ReadDuc
file_path = 'path/to/your/file.txt'
obj = Read.new(file_path)

# Example usage of the delete_csv_columns method
begin
  result = obj.delete_csv_columns
  puts "Result of delete_csv_columns: #{result}"
rescue => e
  puts "Error: #{e.message}"
end
