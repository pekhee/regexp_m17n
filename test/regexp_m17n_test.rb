# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    encodings_as_string = Encoding.list.map(&:to_s)

    encodings_as_string.each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end
end
