# CHANGELOG

## [1.3.0] - 2024-05-11
### Added
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

## [1.6.0] - 2024-11-11
### Added
- Added `filter` feature to support line operations for delete and replace based on matching location (`:start`, `:body`, or `:end`).
- Implemented `apply_filter` to handle filtering logic dynamically for each line, allowing deletion or replacement of lines that match specific criteria.
- Modified `initialize` to accept only the filename instead of the full path, with logic to set the default path to the current directory.

### Fixed
- Fixed an issue with `File.absolute_path?` and `File.join` to ensure these methods are called from the global scope (`::File`).
