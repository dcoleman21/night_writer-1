class BrailleConverter

  attr_reader   :braille_library,
                :output_text

  def initialize
    @output_text = []
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
    transposed = transpose(braille_array)
    output_to_braille(transposed)
  end

  def split_characters(message)
    message.chars
  end

  def translate_to_braille_array(split)
    split.map do |letter|
      braille_library[letter]
    end
  end

  def transpose(braille_array)
    braille_array.transpose
  end

  def output_to_braille(actual)
    line_one = transposed[0].join
    line_two = transposed[1].join
    line_three = transposed[2].join
    "#{line_one[0, 80]}\n""#{line_two[0, 80]}\n""#{line_three[0, 80]}\n""#{line_one[81, 161]}\n""#{line_two[81, 161]}\n""#{line_three[81, 161]}"
  end
end
