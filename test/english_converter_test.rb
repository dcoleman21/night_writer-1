require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_converter'

class EnglishConverterTest <  Minitest::Test

  def test_it_exists
    english = EnglishConverter.new

    assert_instance_of EnglishConverter , english

  end




end
