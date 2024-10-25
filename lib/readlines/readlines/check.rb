# readlines/lib/readlines/readlines/check.rb
# Check the spelling of words in the file against a dictionary
require 'fileutils'
require 'json'

module Readlines
    module Check
        def check_spelling_now(dictionary)
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            misspelled_words = content.scan(/\b\w+\b/).reject { |word| dictionary.include?(word.downcase) }
            misspelled_words.uniq
        end
    end
end
