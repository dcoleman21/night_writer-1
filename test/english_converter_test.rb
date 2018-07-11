require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_converter'
require 'pry'

class EnglishConverterTest <  Minitest::Test

  def test_it_exists
    english = EnglishConverter.new

    assert_instance_of EnglishConverter , english
  end

  def test_it_can_delete_new_line_characters
    english = EnglishConverter.new

    assert_equal "0....." , english.delete_new_line_characters("0.\n..\n..")
  end

  def test_it_can_break_up_braille_string

    english = EnglishConverter.new
    actual = english.braille_scanner("0.....")

    assert_equal ["0.","..",".."], actual
  end




end
