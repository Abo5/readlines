# readlines/lib/readlines/readlines/split.rb
require 'fileutils'
require 'json'

module Readlines
  module Split
    def split_file_now(num_parts)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Number of parts must be greater than 0" if num_parts <= 0

      content = ::File.read(@file_path)
      lines = content.lines
      part_size = (lines.size.to_f / num_parts).ceil

      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      file_ext = ::File.extname(@file_path)

      num_parts.times do |i|
        start_index = i * part_size
        end_index = [(i + 1) * part_size - 1, lines.size - 1].min
        part_content = lines[start_index..end_index].join

        part_file_name = "#{file_name}_part#{i + 1}#{file_ext}"
        ::File.write(part_file_name, part_content)
      end
    end

    def split_file_by_size_now(part_size)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)
      raise ArgumentError, "Part size must be greater than 0" if part_size <= 0

      content = ::File.read(@file_path)
      file_size = content.bytesize
      num_parts = (file_size.to_f / part_size).ceil

      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      file_ext = ::File.extname(@file_path)

      start_index = 0
      num_parts.times do |i|
        end_index = [start_index + part_size - 1, file_size - 1].min
        part_content = content.byteslice(start_index..end_index)

        part_file_name = "#{file_name}_part#{i + 1}#{file_ext}"
        ::File.write(part_file_name, part_content)

        start_index = end_index + 1
      end
    end

    def split_by_delimiter_now(delimiter)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      parts = content.split(delimiter)
      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      file_ext = ::File.extname(@file_path)

      parts.each_with_index do |part, index|
        part_file_name = "#{file_name}_part#{index + 1}#{file_ext}"
        ::File.write(part_file_name, part)
      end
    end

    def split_by_pattern_now(pattern)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)
      categories = content.split(pattern)
      file_name = ::File.basename(@file_path, ::File.extname(@file_path))
      file_ext = ::File.extname(@file_path)

      categories.each_with_index do |category, index|
        category_file_name = "#{file_name}_category#{index + 1}#{file_ext}"
        ::File.write(category_file_name, category)
      end
    end
  end
end
