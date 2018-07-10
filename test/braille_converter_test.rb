require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_converter'

class BrailleConverterTest <  Minitest::Test

  def test_it_exists
    braille = BrailleConverter.new

    assert_instance_of BrailleConverter, braille
  end

  def test_it_can_split_a_message_to_single_characters
    braille = BrailleConverter.new

    assert_equal ["h", "i"], braille.split_characters("hi")
  end

  def test_it_can_translate_single_characters
    braille = BrailleConverter.new

    assert_equal [["0.", "00", ".."]],  braille.translate_to_braille_array(["h"])
    assert_equal [["0.", ".0", "00"]],  braille.translate_to_braille_array(["z"])
  end

  def test_it_can_translate_multiple_characters
    braille = BrailleConverter.new

    actual_1 = ["h", "i"]
    actual_2 = ["h", "e", "l", "l", "o"]

    expected_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    expected_2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    assert_equal expected_1, braille.translate_to_braille_array(actual_1)
    assert_equal expected_2, braille.translate_to_braille_array(actual_2)
  end


  def test_it_can_transpose
    braille = BrailleConverter.new

    actual = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]


    expected = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]

    assert_equal expected, braille.transpose(actual)
  end

  def test_it_can_create_strings
    braille = BrailleConverter.new

    actual = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]

    expected = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    assert_equal expected, braille.create_strings(actual)
  end

  def test_it_can_format_lines_under_eighty
    braille = BrailleConverter.new

    actual = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, braille.format_lines(actual)
  end

  def test_it_can_format_lines_over_eighty
    braille = BrailleConverter.new

    input = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
              "..................................................................................",
              ".................................................................................."]

    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."
    actual = braille.format_lines(input)
    assert_equal expected, actual
  end

  def test_it_can_format_in_chunks_of_eighty
    braille = BrailleConverter.new

    input = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
              "..................................................................................",
              ".................................................................................."]

    output = [["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0."],
              ["................................................................................", ".."],
              ["................................................................................", ".."]]

    actual = braille.chunks_of_eighty(input)
    assert_equal output, actual
  end

  def test_it_can_flatten_chunks
    braille = BrailleConverter.new

    input = [["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0."],
              ["................................................................................", ".."],
              ["................................................................................", ".."]]

    output = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0.",
              "................................................................................", "..",
              "................................................................................", ".."]

    actual = braille.flatten_chunks(input)

    assert_equal output, actual
  end

  def test_it_can_join_flattened_chunks
    braille = BrailleConverter.new

    input = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0.",
              "................................................................................", "..",
              "................................................................................", ".."]

    output = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n0.\n................................................................................\n..\n................................................................................\n.."

    actual = braille.join_flattened_chunks(input)

    assert_equal output, actual
  end
end
