require_relative "./braille_converter"


class EnglishConverter
 attr_reader :english_library

  def initialize
    braille = BrailleConverter.new
    @english_library = braille.braille_library.invert
  end

  def translate(braille_message)
    deleted = delete_new_line_characters(braille_message)
    scanned = braille_scanner(deleted)
    first = first_element(scanned)
    second = second_element(scanned)
    third = third_element(scanned)
    zipped = zip_elements(first, second, third)

  end

  def delete_new_line_characters(braille_message)
    braille_message.delete("\n")
  end

  def braille_scanner(deleted)
    string_length = deleted.length / 3
    deleted.scan(/.{1,#{string_length}}/)
  end

  def first_element(scanned)
    scanned.fetch(0).scan(/.{1,2}/)
  end

  def second_element(scanned)
    scanned.fetch(1).scan(/.{1,2}/)
  end

  def third_element(scanned)
    scanned.fetch(2).scan(/.{1,2}/)
  end

  def zip_elements(first, second, third)
    first.zip(second, third)
  end

  def map_braille_array(zipped)
    zipped.map do |letter|
      @english_library[letter]
    end
  end


end
