# readlines/lib/readlines/readlines/search.rb
# Search for a specific value in the file and optionally show the line numbers
require 'fileutils'
require 'json'
module Readlines
  module Search
    def search_about_now(value, show_lines: false)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)

      if content.include?(value)
        if show_lines
          lines = content.lines
          matched_lines = lines.each_with_index.select { |line, index| line.include?(value) }
          matched_lines.map { |(line, line_number)| line_number + 1 }
        else
          true
        end
      else
        false
      end
    end

    def search_multiple_patterns_now(patterns)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      result = {}
      patterns.each do |pattern|
        count = content.scan(pattern).length
        result[pattern] = count
      end
      result
    end

    def search_in_range_now(start_line, end_line, pattern)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      range = (start_line - 1)..(end_line - 1)
      matched_lines = content[range].select { |line| line.match?(pattern) }
      matched_lines
    end

    def search_logical_patterns_now(patterns, operator)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Invalid logical operator: #{operator}" unless %w[AND OR].include?(operator)

      content = ::File.read(@file_path)
      matched_lines = content.lines.select do |line|
        case operator
        when 'AND'
          patterns.all? { |pattern| line.match?(pattern) }
        when 'OR'
          patterns.any? { |pattern| line.match?(pattern) }
        end
      end
      matched_lines
    end
  end
end