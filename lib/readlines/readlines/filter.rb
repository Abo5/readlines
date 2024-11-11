# readlines/lib/readlines/readlines/filter.rb
# Replace and Delete lines from the file
require_relative 'delete'
require_relative 'replace'

module Readlines
    module Filter
      def apply_filter(line, value, query, operation, replacement = nil)
        case query
        when :start
          matched = line.strip.start_with?(value.to_s)
        when :body
          matched = line.include?(value.to_s)
        when :end
          matched = line.strip.end_with?(value.to_s)
        else
          raise Readlines::Error::ArgumentError, "Invalid query type. Use :start, :body, or :end."
        end
  
        if matched
          case operation
          when :delete
            return nil
          when :replace
            raise Readlines::Error::ArgumentError, "Replacement value is required for replace operation." if replacement.nil?
  
            pattern = case query
            when :start
                /^#{Regexp.quote(value.to_s)}/
            when :body
                /#{Regexp.quote(value.to_s)}/
            when :end
                /#{Regexp.quote(value.to_s)}$/
            end
  
            return line.gsub(pattern, replacement)
          else
            raise Readlines::Error::ArgumentError, "Invalid operation type. Use :delete or :replace."
          end
        else
          line
        end
      end
    end
  end
  