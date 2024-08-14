# readlines/lib/readlines/readlines/sort.rb
# Sort the lines of the file alphabetically
require 'fileutils'
require 'json'

module Readlines
    module Sort
        def sort_alphabetically_now
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            sorted_lines = content.lines.sort_by { |line| line.strip }
            updated_content = sorted_lines.join
            ::File.write(@file_path, updated_content)
            updated_content
        end
    end
end
