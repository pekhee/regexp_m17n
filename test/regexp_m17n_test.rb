# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    encodings_as_string = Encoding.list.map(&:to_s)

    encodable_list = encodings_as_string.select do |enc|
      begin
        '.'.encode(enc)
        true
      rescue Encoding::ConverterNotFoundError
        false
      end
    end

    encodable_list.each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end
end
