require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_converter'
require 'pry'

class EnglishConverterTest <  Minitest::Test

  def test_it_exists
    english = EnglishConverter.new

    assert_instance_of EnglishConverter, english
  end

  def test_it_can_delete_new_line_characters
    english = EnglishConverter.new

    assert_equal "0....." , english.delete_new_line_characters("0.\n..\n..")
  end

  def test_it_can_break_strings_by_length
    english = EnglishConverter.new

    assert_equal ["0.", "..", ".."], english.braille_scanner("0.....")
    assert_equal ["0.0.", "....", "....",], english.braille_scanner("0.0.........")
    assert_equal ["0.0.0.", "......", "......",], english.braille_scanner("0.0.0.............")
  end

  def test_It_can_make_elements_into_arrays
    english = EnglishConverter.new

    expected = ["0."]

    input = ["0.", "..", ".."]

    assert_equal expected, english.first_elements(input)
  end
end
