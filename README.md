[![Gem Version](https://badge.fury.io/rb/readlines.svg)](https://badge.fury.io/rb/readlines)
# Readlines Library

Readlines is a powerful and versatile Ruby library for file manipulation and processing. It provides a wide range of functionality to read, analyze, and modify the contents of text files efficiently.

## Features

- Read the entire file content or specific parts of it.
- Search for specific values in the file and display matching line numbers.
- Count the number of lines in the file based on a keyword or delimiter.
- Replace specific patterns in the file with replacement text.
- Remove empty lines from the file.
- Sort the lines of the file alphabetically.
- Split the file into a specified number of parts.
- Merge multiple files into a single file.
- Convert the encoding of the file from one encoding to another.
- Replace special characters in the file with a replacement string.
- Remove unwanted characters from the file.
- Split the file by a specified size.
- Convert the file to a specified format (txt, csv, json).
- Search for multiple patterns in the file and count occurrences of each pattern.
- Replace multiple patterns in the file in a single operation.
- Split the file based on a specified delimiter.
- Merge multiple files into a single file with a specified separator between each file's content.
- Check if a specific pattern exists in the file.
- Delete specific lines from the file with the option to remove resulting empty lines.
- Reverse the order of the file contents.
- Search for a pattern within a specified range of lines.
- Count the number of characters in the file or in a specific line.
- Count the number of words in the file or in a specific line.
- Extract specific patterns from the file.
- Convert the file contents into an array of lines.
- Validate the file contents against a set of rules.
- Remove duplicate lines from the file.
- Get statistics about the file (number of lines, characters, words).
- Search for logical patterns in the file using AND and OR operators.
- Split the file based on a specified pattern.
- Delete specific columns from a CSV file.
- Replace a specific value in a CSV column.
- Check for spelling errors in the file using a dictionary.
- Encrypt the file contents using a key.
- Decrypt the encrypted file contents using a key.
- Get the file size in different units (bytes, kilobytes, megabytes, gigabytes).

## Installation

To use the Readlines library in your Ruby project, you can install it via RubyGems. Run the following command:

```
gem install readlines
```

Alternatively, you can add the following line to your project's Gemfile:

```ruby
gem 'readlines'
```

Then, run `bundle install` to install the library and its dependencies.

## Usage

To start using the Readlines library, require it in your Ruby script:

```ruby
require 'readlines'
```

Create an instance of the `Read` class, providing the path to the file you want to work with:

```ruby
file_path = '/path/to/your/file.txt'
read = Read.new(file_path)
```

Now you can use the various methods provided by the library to manipulate and process the file contents. Here are some examples:
```ruby
# imagen you have file inside of it data like this and you want count all data of names how manually no you can use this method and that will count for you body 😁
# ++++++++++++++++++++++++++++++++++++
# name : 'john'
# phone : '+1 332-332-3322'
#++++++++++++++++++++++++++++++++++++
read = Read.new(file_path, count: 'name', split: '++++++++++++++++++++++++++++++++++++')
puts read.line_count
```
```ruby
# Read the entire file content
content = read.read_lines
puts content
```
```ruby
# Search for a specific value in the file and display matching line numbers
value = 'example'
result = read.search_about(value, show_lines: true)
puts result
```
```ruby
# Count the number of lines in the file based on a keyword or delimiter
keyword = 'example'
delimiter = '---'
count = read.line_count(count: keyword, split: delimiter)
puts count
```
```ruby
# Replace specific patterns in the file with replacement text
pattern = /example/
replacement = 'new_example'
updated_content = read.replace(pattern, replacement)
puts updated_content
```
```ruby
# Remove empty lines from the file
updated_content = read.remove_empty_lines
puts updated_content
```
```ruby
# Sort the lines of the file alphabetically
sorted_content = read.sort_alphabetically
puts sorted_content
```
```ruby
# Split the file into a specified number of parts
num_parts = 3
read.split_file(num_parts)
```
```ruby
# Merge multiple files into a single file
file_paths = ['/path/to/file1.txt', '/path/to/file2.txt']
merged_file = read.merge_files(file_paths)
puts merged_file
```
```ruby
# Convert the encoding of the file from one encoding to another
from_encoding = 'UTF-8'
to_encoding = 'ISO-8859-1'
read.convert_encoding(from_encoding, to_encoding)
```
```ruby
# Replace special characters in the file with a replacement string
replacement = '_'
updated_content = read.replace_special_characters(replacement)
puts updated_content
```
```ruby
# Remove unwanted characters from the file
unwanted_chars = '!@#$%^&*()'
updated_content = read.remove_unwanted_characters(unwanted_chars)
puts updated_content
```
```ruby
# Split the file by a specified size
part_size = 1024 # 1 KB
read.split_file_by_size(part_size)
```
```ruby
# Convert the file to a specified format
format = 'csv'
converted_file = read.convert_to_format(format)
puts converted_file
```
```ruby
# Search for multiple patterns in the file and count occurrences of each pattern
patterns = [/example/, /pattern/]
result = read.search_multiple_patterns(patterns)
puts result
```
```ruby
# Replace multiple patterns in the file in a single operation
pattern_replacement_hash = {/example/ => 'new_example', /pattern/ => 'new_pattern'}
updated_content = read.replace_multiple_patterns(pattern_replacement_hash)
puts updated_content
```
```ruby
# Split the file based on a specified delimiter
delimiter = '---'
read.split_by_delimiter(delimiter)
```
```ruby
# Merge multiple files into a single file with a specified separator between each file's content
file_paths = ['/path/to/file1.txt', '/path/to/file2.txt']
separator = '---'
merged_file = read.merge_files(file_paths, separator: separator)
puts merged_file
```
```ruby
# Check if a specific pattern exists in the file
pattern = /example/
exists = read.pattern_exists?(pattern)
puts exists
```
```ruby
# Delete specific lines from the file with the option to remove resulting empty lines
line_numbers = [2, 4, 6]
updated_content = read.delete_lines(line_numbers, delete_space: true)
puts updated_content
```
```ruby
# Reverse the order of the file contents
reversed_content = read.reverse_content
puts reversed_content
```
```ruby
# Search for a pattern within a specified range of lines
start_line = 5
end_line = 10
pattern = /example/
matched_lines = read.search_in_range(start_line, end_line, pattern)
puts matched_lines
```
```ruby
# Count the number of characters in the file or in a specific line
total_characters = read.character_count
puts total_characters

line_number = 3
line_characters = read.character_count(line_specific: line_number)
puts line_characters
```
```ruby
# Count the number of words in the file or in a specific line
total_words = read.word_count
puts total_words

line_number = 3
line_words = read.word_count(line_specific: line_number)
puts line_words
```
```ruby
# Extract specific patterns from the file
patterns = [/email:\s*\S+/, /phone:\s*\S+/]
extracted_data = read.extract_patterns(patterns)
puts extracted_data
```
```ruby
# Convert the file contents into an array of lines
lines_array = read.convert_to_array
puts lines_array
```
```ruby
# Validate the file contents against a set of rules
rules = [/^[A-Z]/, /\b\d{3}-\d{3}-\d{4}\b/]
is_valid = read.validate_content(rules)
puts is_valid
```
```ruby
# Remove duplicate lines from the file
unique_content = read.delete_duplicate_lines
puts unique_content
```
```ruby
# Get statistics about the file
stats = read.file_statistics
puts stats
```
```ruby
# Search for logical patterns in the file using AND and OR operators
patterns = [/example/, /pattern/]
and_matched_lines = read.search_logical_patterns(patterns, 'AND')
puts and_matched_lines
```
```ruby
or_matched_lines = read.search_logical_patterns(patterns, 'OR')
puts or_matched_lines
```
```ruby
# Split the file based on a specified pattern
pattern = /Chapter \d+:/
read.split_by_pattern(pattern)
```
```ruby
# Delete specific columns from a CSV file
column_indices = [1, 3]
updated_csv = read.delete_csv_columns(column_indices)
puts updated_csv
```
```ruby
# Replace a specific value in a CSV column
column_index = 2
old_value = 'old_value'
new_value = 'new_value'
updated_csv = read.replace_csv_value(column_index, old_value, new_value)
puts updated_csv
```
```ruby
# Check for spelling errors in the file using a dictionary
dictionary = ['example', 'pattern', 'file']
misspelled_words = read.check_spelling(dictionary)
puts misspelled_words
```
```ruby
# Encrypt the file contents using a key
key = 5
encrypted_file = read.encrypt_content(key)
puts encrypted_file
```
```ruby
# Decrypt the encrypted file contents using a key
encrypted_file_path = '/path/to/encrypted_file.txt'
decrypted_file = read.decrypt_content(key, encrypted_file_path)
puts decrypted_file
```
```ruby
# Get the file size in different units
file_size_bytes = read.file_size
puts file_size_bytes

file_size_kb = read.file_size(unit: :kilobytes)
puts file_size_kb

file_size_mb = read.file_size(unit: :megabytes)
puts file_size_mb

file_size_gb = read.file_size(unit: :gigabytes)
puts file_size_gb
```

## Error Handling

The Readlines library provides custom error classes to handle specific exceptions:

- `Readlines::Error`: General error class for all exceptions in the library.
- `Readlines::NotFoundError`: Raised when a file is not found.
- `Readlines::MissingFilePathError`: Raised when a file path is missing or empty.
- `Readlines::InvalidUnitError`: Raised when an invalid unit is provided for file size conversion.

These error classes help in handling and debugging exceptions that may occur while using the library.

## Contributing

Contributions to the Readlines library are welcome! If you find any bugs, have suggestions for improvements, or want to add new features, please open an issue or submit a pull request on the [GitHub repository](https://github.com/abo5/readlines).

When contributing, please ensure that your code follows the existing coding style and includes appropriate tests.

## License

The Readlines library is open-source and released under the [MIT License](https://opensource.org/licenses/MIT). You are free to use, modify, and distribute the library in accordance with the terms of the license.

## Contact

If you have any questions, suggestions, or feedback regarding the Readlines library, please feel free to contact the maintainer:

- Name: Maven
- GitHub: [Maven's GitHub](https://github.com/abo5)

We appreciate your interest in the Readlines library and look forward to your contributions and feedback!



# readlines
# readlines
