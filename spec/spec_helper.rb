$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'djikstra'
require 'pry-debugger'


def expect_same_array(expected, keys)
  expect(keys.sort).to eq expected
end
