require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'
require 'pry'

class BrailleTest <  Minitest::Test

  def test_it_exists
    braille = Braille.new

    assert_instance_of Braille, braille
  end

  def test_it_can_translate_single_characters
    braille = Braille.new


    assert_equal [["0.", "00", ".."]],  braille.translate("h")
    assert_equal [["0.", ".0", "00"]],  braille.translate("z")
  end

  def test_it_can_translate_multiple_characters
    braille = Braille.new

    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal expected,  braille.translate("hello")
  end
end
