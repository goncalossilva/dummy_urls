require "rubygems"
require "dummy"
require "dummy_data"
require "generators/urls/urls_generator"

module Dummy
  module Generators
    class MissingDummyfile < RuntimeError; end
  end
end
