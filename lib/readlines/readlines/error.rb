# readlines/lib/readlines/readlines/error.rb

module Readlines
  module Error
    class BaseError < StandardError
      def initialize(message = "An error occurred in Readlines")
        super
      end
    end

    class NotFoundError < BaseError
      def initialize(message = "File not found.")
        super
      end
    end

    class MissingFilePathError < BaseError
      def initialize(message = "File path is missing.")
        super
      end
    end

    class InvalidUnitError < BaseError
      def initialize(message = "Invalid unit provided.")
        super
      end
    end

    class ArgumentError < BaseError
      def initialize(message = "Invalid argument provided.")
        super
      end
    end
  end
end
