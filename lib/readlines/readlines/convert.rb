# readlines/lib/readlines/readlines/convert.rb
# Convert the encoding of the file
require 'fileutils'
require 'json'

module Readlines
  module Convert
    def convert_encoding_now(from_encoding, to_encoding)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path, encoding: from_encoding)
      ::File.write(@file_path, content.encode(to_encoding))
    end

    def convert_to_format_now(format)
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.read(@file_path)

      case format.downcase
      when 'txt'
      when 'csv'
        content = content.lines.map { |line| line.strip.split(',') }.map { |fields| fields.join(',') }.join("\n")
      when 'json'
        data = content.lines.map { |line| line.strip.split(',') }
        content = JSON.pretty_generate(data)
      else
        raise ArgumentError, "Unsupported format: #{format}. Supported formats are .txt, .csv, and .json."
      end

      converted_file_path = "#{::File.basename(@file_path, ::File.extname(@file_path))}-copy.#{format.downcase.delete('.')}"
      ::File.write(converted_file_path, content)
      converted_file_path
    end

    def convert_to_array_now
      raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

      content = ::File.readlines(@file_path)
      content.map(&:chomp)
    end
  end
end