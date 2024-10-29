# readlines/lib/read.rb
# lib/read.rb
require_relative 'readlines/read'

module Read
  def self.new(file_path, count: nil, split: nil)
    Readlines::ReadDuc.new(file_path, count: count, split: split)
  end
end
