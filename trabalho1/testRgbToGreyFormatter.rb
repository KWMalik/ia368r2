require 'test/unit'
require './rgbToGreyFormatter'

class TestRGBToGreyFormatter < Test::Unit::TestCase
  def test_format
    formatted = RGBToGreyFormatter.stringRGBToGrey('1 2 3')
    assert_equal(formatted,'2 4 6')
  end
end

