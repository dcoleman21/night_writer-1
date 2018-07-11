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
    assert_equal ["0.0.", "....", "...."], english.braille_scanner("0.0.........")
    assert_equal ["0.0.0.", "......", "......"], english.braille_scanner("0.0.0.............")
  end

  def test_it_can_grab_first_element
    english = EnglishConverter.new

    expected_1 = ["0."]
    expected_2 = ["0.", "0."]

    input_1 = ["0.", "..", ".."]
    input_2 = ["0.0.", "....", "...."]

    assert_equal expected_1, english.first_element(input_1)
    assert_equal expected_2, english.first_element(input_2)


  end

  def test_it_can_grab_second_element
    english = EnglishConverter.new

    expected = [".."]

    input = ["0.", "..", ".."]

    assert_equal expected , english.second_element(input)
  end

  def test_it_can_grab_third_element
    english = EnglishConverter.new

    expected = [".."]

    input = ["0.", "..", ".."]

    assert_equal expected , english.third_element(input)
  end

  def test_it_can_zip_a_single_letter

    english = EnglishConverter.new
    input_1 = ["0."]
    input_2 = [".."]
    input_3 = [".."]

    assert_equal [["0.", "..", ".."]] , english.zip_elements(input_1, input_2, input_3)

  end

  def test_it_Can_zip_multiple_leters
    english = EnglishConverter.new
    input_1 = ["0.", "0."]
    input_2 = ["..", ".."]
    input_3 = ["..", ".."]
    expected = [["0.", "..", ".."], ["0.", "..", ".."]]

    assert_equal expected ,  english.zip_elements(input_1, input_2, input_3)
  end


end
