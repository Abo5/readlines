# spec/spec_helper.rb
require 'rspec'
require 'fileutils'

RSpec.configure do |config|
  config.color = true

  config.formatter = :documentation

  config.order = :random

  config.disable_monkey_patching!

end
