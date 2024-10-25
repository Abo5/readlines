# readlines/lib/readlines/readlines/error.rb

module Readlines
  module Error
    class Error < StandardError; end

    class NotFoundError < Error; end

    class MissingFilePathError < Error; end

    class InvalidUnitError < StandardError; end
  end
end