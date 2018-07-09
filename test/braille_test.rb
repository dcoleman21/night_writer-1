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

  def test_it_can_shovel_to_line_one
    braille = Braille.new

    actual_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    actual_2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    expected_1 = "0..0"
    expected_2 = "0.0.0.0.0."

    assert_equal expected_1, braille.line_one(actual_1)
    assert_equal expected_2, braille.line_one(actual_2)
  end

  def test_it_can_shovel_to_line_two
    braille = Braille.new

    actual_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    actual_2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    expected_1 = "000."
    expected_2 = "00.00.0..0"

    assert_equal expected_1, braille.line_two(actual_1)
    assert_equal expected_2, braille.line_two(actual_2)
  end

  def test_it_can_shovel_to_line_three
    braille = Braille.new

    actual_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    actual_2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    expected_1 = "...."
    expected_2 = "....0.0.0."

    assert_equal expected_1, braille.line_three(actual_1)
    assert_equal expected_2, braille.line_three(actual_2)
  end

  def test_it_can_create_three_lines
    braille = Braille.new

    actual_1 = "0..0"
    actual_2 = "000."
    actual_3 = "...."

    expected_1 = "0..0\n 000.\n ...."

    assert_equal expected_1, braille.three_lines(actual_1, actual_2, actual_3)
  end

  def test_it_can_limit_to_eighty_characters_on_one_line
    braille = Braille.new

    assert_equal 
  end
end
