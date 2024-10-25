# readlines/lib/readlines/readlines/file.rb
# Get statistics about the file
require 'fileutils'
require 'json'

module Readlines
    module File
        def file_statistics_now
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            {
              lines: content.lines.count,
              characters: content.length,
              words: content.split.length
            }
        end
    end
end

