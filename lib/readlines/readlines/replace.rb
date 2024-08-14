# readlines/lib/readlines/readlines/replace.rb
# Replace a specific pattern with a replacement string in the file
require 'fileutils'
require 'json'

module Readlines
  module Replace
    def replace_now(pattern, replacement)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      updated_content = content.gsub(pattern, replacement)
      ::File.write(@file_path, updated_content)
      updated_content
    end

    def replace_special_characters_now(replacement)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path, encoding: 'UTF-8')
      updated_content = content.gsub(/[^[:alnum:]\s]/, replacement)
      ::File.write(@file_path, updated_content)
      updated_content
    end

    def replace_multiple_patterns_now(pattern_replacement_hash)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      pattern_replacement_hash.each do |pattern, replacement|
        content.gsub!(pattern, replacement)
      end
      ::File.write(@file_path, content)
      content
    end

    def replace_csv_value_now(column_index, old_value, new_value)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      updated_content = content.map do |line|
        values = line.chomp.split(',')
        values[column_index] = values[column_index] == old_value ? new_value : values[column_index]
        values.join(',')
      end.join("\n")
      ::File.write(@file_path, updated_content)
      updated_content
    end
  end
end