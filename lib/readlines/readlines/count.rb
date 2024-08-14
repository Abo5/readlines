# readlines/lib/readlines/readlines/count.rb
# Count the number of lines in the file based on the specified keyword and delimiter
require 'fileutils'
require 'json'

module Readlines
  module Count
    def line_count_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      count = 0
      content = ::File.read(@file_path)
      if @split_delimiter
        sections = content.split(@split_delimiter)
        sections.each do |section|
          count += 1 if @count_keyword && section.include?(@count_keyword)
        end
      else
        content.each_line do |line|
          count += 1 if @count_keyword.nil? || line.include?(@count_keyword)
        end
      end
      count
    end

    # Read the entire content of the file
    def read_lines_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      content = ::File.read(@file_path)
      content
    end

    # Count the number of characters in the file or a specific line
    def character_count_now(line_specific: false)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      if line_specific.is_a?(Integer)
        line = content.lines[line_specific - 1]
        line.length
      else
        content.length
      end
    end

    # Count the number of words in the file or a specific line
    def word_count_now(line_specific: false)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      if line_specific.is_a?(Integer)
        line = content.lines[line_specific - 1]
        line.split.length
      else
        content.split.length
      end
    end
  end
end
