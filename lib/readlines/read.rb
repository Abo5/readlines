# readlines/lib/readlines/read.rb
require_relative 'readlines/check'
require_relative 'readlines/content'
require_relative 'readlines/convert'
require_relative 'readlines/count'
require_relative 'readlines/delete'
require_relative 'readlines/error'
require_relative 'readlines/file'
require_relative 'readlines/info'
require_relative 'readlines/merge'
require_relative 'readlines/pattern'
require_relative 'readlines/replace'
require_relative 'readlines/search'
require_relative 'readlines/sort'
require_relative 'readlines/split'
require_relative 'readlines/filter'
require 'fileutils'
require 'json'

module Readlines
  class ReadDuc
    include Readlines::Count
    include Readlines::Delete
    include Readlines::Convert
    include Readlines::Search
    include Readlines::Replace
    include Readlines::File
    include Readlines::Filter
    include Readlines::Merge
    include Readlines::Info
    include Readlines::Pattern
    include Readlines::Sort
    include Readlines::Split
    include Readlines::Content
    attr_reader :file_path

    def initialize(file_path, count: nil, split: nil)
      file_path = ::File.join(Dir.pwd, file_path) unless ::File.absolute_path?(file_path)
  
      raise Readlines::Error::MissingFilePathError, 'File not found at provided path' unless ::File.exist?(file_path)
      raise Readlines::Error::MissingFilePathError, 'You should provide a file path, e.g., "/path/to/file.txt"' if file_path.nil? || file_path.empty?
    
    
      @file_path = file_path
      @count_keyword = count
      @split_delimiter = split
    end
    

    include Readlines::Count
    include Readlines::Delete
    include Readlines::Convert
    include Readlines::Search
    include Readlines::Replace
    include Readlines::File
    include Readlines::Filter
    include Readlines::Merge
    include Readlines::Info
    include Readlines::Pattern
    include Readlines::Sort
    include Readlines::Split
    include Readlines::Content
    include Readlines::Filter

    # Count operations
    def line_count
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      line_count_now()
    end

    def character_count(line_specific: false)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      character_count_now(line_specific: line_specific)
    end

    def word_count(line_specific: false)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      word_count_now(line_specific: line_specific)
    end

    # Read operations
    def read_lines
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      read_lines_now()
    end

    def info
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      info_now()
    end

    # Search operations
    def search_about(value, show_lines: false)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      search_about_now(value, show_lines: show_lines)
    end

    def search_multiple_patterns(patterns)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      search_multiple_patterns_now(patterns)
    end

    def search_in_range(start_line, end_line, pattern)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      search_in_range_now(start_line, end_line, pattern)
    end

    def search_logical_patterns(patterns, operator)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Invalid logical operator: #{operator}" unless %w[AND OR].include?(operator)
      search_logical_patterns_now(patterns, operator)
    end

    # Replace operations
    def replace(pattern, replacement)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      replace_now(pattern, replacement)
    end

    def replace_special_characters(replacement)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      replace_special_characters_now(replacement)
    end

    def replace_multiple_patterns(pattern_replacement_hash)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      replace_multiple_patterns_now(pattern_replacement_hash)
    end

    def replace_csv_value(column_index, old_value, new_value)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      replace_csv_value_now(column_index, old_value, new_value)
    end

    # Delete operations
    def delete_empty_lines
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_empty_lines_now()
    end

    def delete_unwanted_characters(characters)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_unwanted_characters_now(characters)
    end

    def delete_lines(line_numbers, delete_space: false)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_lines_now(line_numbers, delete_space: delete_space)
    end

    def delete_duplicate_lines
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_duplicate_lines_now()
    end

    def delete_csv_columns(column_indices)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_csv_columns_now(column_indices)
    end

    def delete_right_left_separator(separator, delete_right: false, delete_left: false, keep_separator: false)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      delete_right_left_separator_now(separator, delete_right: delete_right, delete_left: delete_left, keep_separator: keep_separator)
    end

    # Sort operations
    def sort_alphabetically
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      sort_alphabetically_now()
    end

    # Split operations
    def split_file(num_parts)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Number of parts must be greater than 0" if num_parts <= 0
      split_file_now(num_parts)
    end

    def split_file_by_size(part_size)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Part size must be greater than 0" if part_size <= 0
      split_file_by_size_now(part_size)
    end

    def split_by_delimiter(delimiter)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      split_by_delimiter_now(delimiter)
    end

    def split_by_pattern(pattern)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      split_by_pattern_now(pattern)
    end

    # Merge operations
    def merge_files(file_paths)
      raise ArgumentError, "File paths array is empty" if file_paths.empty?
      merge_files_now(file_paths)
    end

    def merge_files_with_specific_line(file_paths, separator: "\n")
      raise ArgumentError, "File paths array is empty" if file_paths.empty?
      merge_files_with_specific_line_now(file_paths, separator: separator)
    end

    # Convert operations
    def convert_encoding(from_encoding, to_encoding)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      convert_encoding_now(from_encoding, to_encoding)
    end

    def convert_to_format(format)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      convert_to_format_now(format)
    end

    def convert_to_array
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      convert_to_array_now()
    end

    # File operations
    def file_size(unit = nil)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      file_size_now(unit)
    end

    def file_statistics
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      file_statistics_now()
    end
    
    ## Replace and Delete lines from the file
    def filter(value, query, operation, replacement = nil)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      processed_lines = []
      ::File.foreach(@file_path) do |line|
        result = apply_filter(line, value, query, operation, replacement)
        processed_lines << result if result 
      end

      ::File.write(@file_path, processed_lines.join)
      processed_lines
    end

    # Pattern operations
    def pattern_exists?(pattern)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      pattern_exists_now?(pattern)
    end

    def extract_patterns(patterns)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      extract_patterns_now(patterns)
    end

    # Content operations
    def reverse_content
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      reverse_content_now()
    end

    def validate_content(rules)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      validate_content_now(rules)
    end

    # Spelling operations
    def check_spelling(dictionary)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      check_spelling_now(dictionary)
    end

    # Encryption operations
    def encrypt_content(key)
      raise Readlines::Error::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      encrypt_content_now(key)
    end

    def decrypt_content(key, encrypted_file_path)
      raise Readlines::Error::NotFoundError, "File not found: #{encrypted_file_path}" unless ::File.exist?(encrypted_file_path)
      decrypt_content_now(key, encrypted_file_path)
    end
  end

  def filter(file_path, value, query, operation, replacement = nil)
    processed_lines = []
    File.foreach(file_path) do |line|
      result = filter(line, value, query, operation, replacement)
      processed_lines << result if result # Only add if result is not nil (for delete operation)
    end
    processed_lines
  end
end