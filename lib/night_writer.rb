require_relative "./braille_converter"

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp
handle.close

braille = BrailleConverter.new


writer = File.open(ARGV[1], "w")
writer.write(braille.translate(incoming_text))
writer.close

puts "Created #{ARGV[1]} containing #{incoming_text.length * 6} characters"
