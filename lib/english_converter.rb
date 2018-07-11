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
    end

    def delete_new_line_characters(braille_message)
        braille_message.delete("\n")
    end

    def braille_scanner(deleted)
      deleted.scan(/.{1,2}/)
    end


end
