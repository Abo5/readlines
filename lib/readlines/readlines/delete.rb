# readlines/lib/readlines/readlines/delete.rb
# Delete empty lines from the file
require 'fileutils'
require 'json'

module Readlines
  module Delete
    def delete_empty_lines_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      content = ::File.read(@file_path)
      updated_content = content.lines.reject { |line| line.strip.empty? }.join
      ::File.write(@file_path, updated_content)
      updated_content
    end

    # Delete unwanted characters from the file
    def delete_unwanted_characters_now(characters)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      updated_content = content.gsub(/[#{Regexp.escape(characters)}]/, '')
      ::File.write(@file_path, updated_content)
      updated_content
    end

    # Delete specific lines from the file and optionally remove empty lines
    def delete_lines_now(line_numbers, delete_space: false)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      updated_content = content.reject.with_index { |_, index| line_numbers.include?(index + 1) }.join

      ::File.write(@file_path, updated_content)

      if delete_space
        remove_empty_lines
      end

      updated_content
    end

    # Delete duplicate lines from the file
    def delete_duplicate_lines_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      unique_content = content.uniq.join
      ::File.write(@file_path, unique_content)
      unique_content
    end

    # Delete specific columns from a CSV file
    def delete_csv_columns_now(column_indices)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      updated_content = content.map do |line|
        values = line.chomp.split(',')
        column_indices.sort.reverse.each { |index| values.delete_at(index) }
        values.join(',')
      end.join("\n")
      ::File.write(@file_path, updated_content)
      updated_content
    end

    def delete_right_left_separator_now(separator, delete_right: false, delete_left: false, keep_separator: false)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      result = ::File.readlines(@file_path).map do |line|
        line.strip!
        next if line.empty?

        parts = line.split(separator, 2)
        separator_keep = keep_separator ? separator : ''

        if delete_right && parts.size > 1
          parts.first + separator_keep
        elsif delete_left && parts.size > 1
          separator_keep + parts.last
        else
          line
        end
      end.compact

      ::File.write(@file_path, result.join("\n"))
      result
    end
  end
end
