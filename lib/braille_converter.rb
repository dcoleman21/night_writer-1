class BrailleConverter

  attr_reader   :output_text

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
    split = split_characters(message)
    braille_array = translate_to_braille_array(split)
    transposed = transpose(braille_array)
    strings = create_strings(transposed)
    format_lines(strings)
  end

  def split_characters(message)
    message.chars
  end

  def translate_to_braille_array(split)
    split.map do |letter|
      @braille_library[letter]
    end
  end

  def transpose(braille_array)
    braille_array.transpose
  end

  def create_strings(transposed)
    lines = []
    transposed.each do |line|
      lines << line.join
    end
    lines
  end

  def format_lines(strings)
    if strings[0].length > 80
      format_long_lines(strings)
    else
      strings.join("\n")
    end
  end

  def format_long_lines(strings)
    chunks = chunks_of_eighty(strings)
    transposed = transpose(chunks)
    flattened = flatten_chunks(transposed)
    join_flattened_chunks(flattened)
  end

  def chunks_of_eighty(strings)
    strings.map do |string|
      string.scan(/.{1,80}/)
    end
  end

  def flatten_chunks(chunks)
    chunks.flatten
  end

  def join_flattened_chunks(flattened)
    flattened.join("\n")
  end
end
