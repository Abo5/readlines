[![Gem Version](https://badge.fury.io/rb/readlines.svg)](https://badge.fury.io/rb/readlines)
# Readlines Library

Readlines is a powerful and versatile Ruby library for file manipulation and processing. It provides a wide range of functionality to read, analyze, and modify the contents of text files efficiently.

## Features

- **File Reading**: Read the entire file content or specific parts.
- **Search Operations**: Search for values and display matching line numbers.
- **Line Counting**: Count lines based on keywords or delimiters.
- **Pattern Replacement**: Replace specific patterns or multiple patterns at once.
- **Delete Empty Lines**: Remove empty lines.
- **Alphabetical Sorting**: Sort lines alphabetically.
- **File Splitting**: Split files into parts or by size.
- **File Merging**: Merge multiple files with a separator.
- **Encoding Conversion**: Convert file encoding.
- **Character Replacement**: Replace special characters or unwanted characters.
- **Format Conversion**: Convert the file to txt, csv, or json.
- **Multiple Pattern Search**: Search and count multiple patterns.
- **Delimiter-Based Splitting**: Split files by delimiter or pattern.
- **Pattern Checking**: Check if patterns exist.
- **Delete Specific Lines**: Delete lines, specific columns in CSV, and duplicates.
- **Reverse Content**: Reverse the file’s content.
- **Range-Based Search**: Search within a specific line range.
- **Character and Word Counting**: Count characters or words.
- **Pattern Extraction**: Extract specific patterns.
- **Content Validation**: Validate against custom rules.
- **Logical Pattern Search**: AND/OR based pattern search.
- **Spelling Check**: Detect spelling errors with a dictionary.
- **Encryption/Decryption**: Encrypt and decrypt content.
- **File Size Calculation**: Display size in bytes, KB, MB, or GB.
- **Filter Operation**: Delete or replace lines based on matching criteria (`:start`, `:body`, or `:end`).

## Installation

To use the Readlines library in your Ruby project, install it via RubyGems:

```bash
gem install readlines
```

Or add it to your Gemfile:

```ruby
gem 'readlines'
```

Run `bundle install` to install the library and its dependencies.

## Usage

Start by requiring `readlines` in your Ruby script:

```ruby
require 'readlines'
```

Create an instance of the `Read` class with the filename (or full path):

```ruby
file_name = 'file.txt'
read = Read.new(file_name)
```

### Examples

#### Basic Operations
```ruby
# Read the entire file content
content = read.read_lines
puts content
```

#### Counting Operations
```ruby
# Count lines containing a specific keyword
count = read.line_count(count: 'example')
puts count

# Count characters in the file or a specific line
total_characters = read.character_count
puts total_characters
line_characters = read.character_count(line_specific: 3)
puts line_characters

# Count words in the file or a specific line
total_words = read.word_count
puts total_words
line_words = read.word_count(line_specific: 3)
puts line_words
```

#### Search Operations
```ruby
# Search for a specific value and show line numbers
result = read.search_about('example', show_lines: true)
puts result

# Search for multiple patterns and count occurrences
patterns = [/example/, /test/]
result = read.search_multiple_patterns(patterns)
puts result

# Check if a pattern exists
pattern_exists = read.pattern_exists?(/example/)
puts pattern_exists

# Search for a pattern within a range of lines
matched_lines = read.search_in_range(5, 10, /example/)
puts matched_lines

# Logical pattern search (AND/OR operators)
and_results = read.search_logical_patterns([/example/, /test/], 'AND')
puts and_results
or_results = read.search_logical_patterns([/example/, /test/], 'OR')
puts or_results
```

#### Replacement Operations
```ruby
# Replace specific patterns in the file
updated_content = read.replace(/example/, 'new_example')
puts updated_content

# Replace multiple patterns at once
pattern_replacement = {/example/ => 'new_example', /test/ => 'new_test'}
updated_content = read.replace_multiple_patterns(pattern_replacement)
puts updated_content

# Replace characters in a CSV column
updated_csv = read.replace_csv_value(2, 'old_value', 'new_value')
puts updated_csv

# Replace special characters with a specified replacement string
updated_content = read.replace_special_characters('_')
puts updated_content
```

#### Deletion Operations
```ruby
# Delete empty lines from the file
updated_content = read.delete_empty_lines
puts updated_content

# Delete specific lines with the option to remove empty lines
updated_content = read.delete_lines([2, 4, 6], delete_space: true)
puts updated_content

# Delete unwanted characters
updated_content = read.delete_unwanted_characters('!@#$%^')
puts updated_content

# Delete duplicate lines
unique_content = read.delete_duplicate_lines
puts unique_content

# Delete specific columns in a CSV file
updated_csv = read.delete_csv_columns([1, 3])
puts updated_csv

# Filter lines based on criteria
# Replace lines starting with "hello" with "hi"
read.filter("hello", :start, :replace, "hi")
read.filter("world", :body, :replace, "guys")
read.filter("123", :end, :replace, "456")

# Delete lines containing "unwanted_text" from start or end or anywhere using `:start` or `:end` or `:body`
read.filter("unwanted_text", :start, :delete)
read.filter("unwanted_text", :body, :delete)
read.filter("unwanted_text", :end, :delete)
```

#### File Splitting and Merging
```ruby
# Split the file into 3 parts
read.split_file(3)

# Split by size (in bytes)
read.split_file_by_size(1024) # 1 KB

# Split by delimiter
read.split_by_delimiter('---')

# Split by a pattern
read.split_by_pattern(/Chapter \d+/)

# Merge multiple files
merged_file = read.merge_files(['/path/to/file1.txt', '/path/to/file2.txt'])
puts merged_file

# Merge files with a separator
merged_file_with_separator = read.merge_files(['/file1.txt', '/file2.txt'], separator: '---')
puts merged_file_with_separator
```

#### Encoding and Format Conversion
```ruby
# Convert encoding
read.convert_encoding('UTF-8', 'ISO-8859-1')

# Convert file format to CSV
converted_csv = read.convert_to_format('csv')
puts converted_csv
```

#### Extracting and Validating Content
```ruby
# Extract specific patterns (e.g., email addresses)
patterns = [/email:\s*\S+/, /phone:\s*\S+/]
extracted_data = read.extract_patterns(patterns)
puts extracted_data

# Validate content with a set of rules
rules = [/^[A-Z]/, /\b\d{3}-\d{3}-\d{4}\b/]
is_valid = read.validate_content(rules)
puts is_valid

# Check for spelling errors using a dictionary
dictionary = ['example', 'pattern', 'file']
misspelled_words = read.check_spelling(dictionary)
puts misspelled_words
```

#### File Size and Statistics
```ruby
# Get file size in different units
file_size_bytes = read.file_size
puts file_size_bytes
file_size_kb = read.file_size(unit: :kilobytes)
puts file_size_kb
file_size_mb = read.file_size(unit: :megabytes)
puts file_size_mb
file_size_gb = read.file_size(unit: :gigabytes)
puts file_size_gb

# Get statistics about the file
file_stats = read.file_statistics
puts file_stats
```

#### Encryption and Decryption
```ruby
# Encrypt content using a key
encrypted_content = read.encrypt_content(5)
puts encrypted_content

# Decrypt the content using the same key
decrypted_content = read.decrypt_content(5, '/path/to/encrypted_file.txt')
puts decrypted_content
```

#### Reverse and Additional Operations
```ruby
# Reverse the order of file contents
reversed_content = read.reverse_content
puts reversed_content
```

## Error Handling

The Readlines library provides custom error classes for handling specific exceptions:

- **Readlines::Error**: General error class for all exceptions.
- **Readlines::NotFoundError**: Raised when the file is not found.
- **Readlines::MissingFilePathError**: Raised when a file path is missing or empty.
- **Readlines::InvalidUnitError**: Raised for invalid file size units.

These error classes help in handling and debugging exceptions that may occur while using the library.

## Contributing

Contributions are welcome! If you find bugs, have suggestions, or want to add features, please open an issue or submit a pull request on the [GitHub repository](https://github.com/abo5/readlines).

When contributing, please ensure that your code follows the existing coding style and includes appropriate tests.

## License

The Readlines library is open-source and released under the [MIT License](https://opensource.org/licenses/MIT).
