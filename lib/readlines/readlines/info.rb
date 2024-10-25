# readlines/lib/readlines/readlines/info.rb
# Get the file size in the specified unit
require 'fileutils'
require 'json'

module Readlines
  module Info
    def file_size_now(unit = nil)
      size = ::File.size(@file_path)

      if unit.nil?
        size
      else
        case unit
        when :gigabytes, :g
          size / (1024.0 * 1024.0 * 1024.0)
        when :megabytes, :m
          size / (1024.0 * 1024.0)
        when :kilobytes, :k
          size / 1024.0
        when :bytes, :b
          size
        else
          raise Readlines::InvalidUnitError, "Invalid unit: #{unit}. Supported units are :gigabytes, :megabytes, :kilobytes, or :bytes."
        end
      end
    end

    def info_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      file_info = {
        created_at: ::File.birthtime(@file_path),
        modified_at: ::File.mtime(@file_path),
        path: ::File.absolute_path(@file_path),
        size: ::File.size(@file_path),
        name: ::File.basename(@file_path),
        type: ::File.extname(@file_path)
      }

      if block_given?
        yield file_info
      else
        file_info
      end
    end
  end
end