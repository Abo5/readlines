# readlines/lib/readlines/readlines/merge.rb
# Merge multiple files into a single file
require 'fileutils'
require 'json'

module Readlines
  module Merge
    def merge_files_now(file_paths)
      raise ArgumentError, "File paths array is empty" if file_paths.empty?

      merged_content = file_paths.map do |file_path|
        raise Readlines::NotFoundError, "File not found: #{file_path}" unless ::File.exist?(file_path)
        ::File.read(file_path)
      end.join

      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      merged_file_name = "#{file_name}_merged#{::File.extname(@file_path)}"
      ::File.write(merged_file_name, merged_content)

      merged_file_name
    end

    def merge_files_with_specific_line_now(file_paths, separator: "\n")
      raise ArgumentError, "File paths array is empty" if file_paths.empty?

      merged_content = file_paths.map do |file_path|
        raise Readlines::NotFoundError, "File not found: #{file_path}" unless ::File.exist?(file_path)
        ::File.read(file_path)
      end.join(separator)

      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      merged_file_name = "#{file_name}_merged#{::File.extname(@file_path)}"
      ::File.write(merged_file_name, merged_content)

      merged_file_name
    end
  end
end