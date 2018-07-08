class Braille

  attr_reader   :braille_library

  def initialize
    @braille_library = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
    }
  end

  def translate(message)
    braille_library = @braille_library
    split = split_characters(message)
    braille_array = translate_to_braille_array(split)
    first_line = line_one(braille_array)
    second_line = line_two(braille_array)
    third_line = line_three(braille_array)
  end

  def split_characters(message)
    message.chars
  end

  def translate_to_braille_array(split)
    split.map do |letter|
      braille_library[letter]
    end
  end

  def line_one(braille_array)
    braille_array.map do |letter|
      letter[0]
    end.join
  end
end
