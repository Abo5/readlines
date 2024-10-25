# readlines/lib/readlines/readlines/pattern.rb
# Check if a pattern exists in the file
require 'fileutils'
require 'json'

module Readlines
    module Pattern
        def pattern_exists_now?(pattern)
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            content.match?(pattern)
        end

        def extract_patterns_now(patterns)
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            patterns.flat_map { |pattern| content.scan(pattern) }
        end
    end
end
