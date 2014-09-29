# encoding: UTF-8

require 'rspec'
require 'pry-nav'
require 'cldr-plurals/ruby_runtime'

RSpec.configure do |config|
  config.mock_with :rr
end
