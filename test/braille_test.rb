require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'
require 'pry'

class BrailleTest <  Minitest::Test

  def test_it_exists
    braille = Braille.new

    assert_instance_of Braille, braille
  end

  def test_it_can_split_a_message_to_single_characters
    braille = Braille.new

    assert_equal ["h", "i"], braille.split_characters("hi")
  end

  def test_it_can_translate_single_characters
    braille = Braille.new

    assert_equal [["0.", "00", ".."]],  braille.translate_to_braille_array(["h"])
    assert_equal [["0.", ".0", "00"]],  braille.translate_to_braille_array(["z"])
  end

  def test_it_can_translate_multiple_characters
    braille = Braille.new

    actual_1 = ["h", "i"]
    actual_2 = ["h", "e", "l", "l", "o"]

    expected_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    expected_2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    assert_equal expected_1, braille.translate_to_braille_array(actual_1)
    assert_equal expected_2, braille.translate_to_braille_array(actual_2)
  end


  def test_it_can_transpose
    braille = Braille.new

    actual = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]


    expected = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]

    assert_equal expected, braille.transpose(actual)
  end
end
